//
//  MealsViewModel.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/3/23.
//

import Foundation

extension MealsView {
    @MainActor class MealsViewModel: MealDBViewModel, ObservableObject {
        private var categoryName: String = "Dessert"
        
        private var url: URL? {
            return URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=\(categoryName)")
        }
        
        @Published var meals: [Meal] = [Meal]()
        
        init(categoryName: String) {
            self.categoryName = categoryName
        }
        
        func fetchMeals() async {
            guard let url = url else { return }
            let downloaded: Meals? = await fetch(type: Meals.self, from: url)
            
            if let downloaded = downloaded {
                meals = downloaded.meals.sorted()
            }
        }
    }
}
