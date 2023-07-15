//
//  CategoriesViewModel.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/3/23.
//

import Foundation

extension CategoriesView {
    @MainActor class CategoriesViewModel: MealDBViewModel, ObservableObject {
        private let url: URL? = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")
        
        @Published var categories: [Category] = [Category]()
        
        // Change to false to show all meal categories.
        private var onlyShowDesserts = true
        
        func fetchCategories() async {
            guard let url = url else { return }
            let downloaded: Categories? = await fetch(type: Categories.self, from: url)
            
            if let downloaded = downloaded {
                if onlyShowDesserts {
                    categories = downloaded.categories.filter({ $0.categoryName == "Dessert" }).sorted()
                } else {
                    categories = downloaded.categories.sorted()
                }
            }
        }
    }
}
