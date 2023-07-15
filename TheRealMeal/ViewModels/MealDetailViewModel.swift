//
//  MealDetailViewModel.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/3/23.
//

import Foundation

extension MealDetailView {
    @MainActor class MealDetailViewModel: MealDBViewModel, ObservableObject {
        var mealID: String
        
        private var url: URL? {
            return URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)")
        }
        
        @Published var mealFullDesc: MealFullDesc?
        
        init(mealID: String) {
            self.mealID = mealID
        }
        
        func fetchMealFullDesc() async {
            guard let url = url else { return }
            let downloaded: MealFullDescs? = await fetch(type: MealFullDescs.self, from: url)
            
            if let downloaded = downloaded {
                mealFullDesc = downloaded.meals.first
            }
        }
    }
}
