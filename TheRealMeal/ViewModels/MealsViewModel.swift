//
//  MealsViewModel.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/3/23.
//

import Foundation

extension MealsView {
    @MainActor class MealsViewModel: ObservableObject {
        var categoryName: String
        
        private var url: URL? {
            return URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=\(categoryName)")
        }
        
        @Published var meals: [Meal]
        
        init(categoryName: String = "Dessert") {
            self.categoryName = categoryName
            self.meals = [Meal]()
        }
        
        func fetchMeals() async {
            guard let url = url else { return }
            let downloaded: Meals? = await Utilities.fetch(type: Meals.self, from: url)
            
            if let downloaded = downloaded {
                meals = downloaded.meals.sorted()
            }
        }
    }
}
