//
//  CategoriesViewModel.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/3/23.
//

import Foundation

@MainActor class CategoriesViewModel: ObservableObject {
    static let url: URL? = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")
}
