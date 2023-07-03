//
//  Meals.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/3/23.
//

import Foundation

@MainActor class MealsController: ObservableObject {
    var categories: [Category]
    var simpleMealDescriptions: [Meal]
    var fullMealDescriptions: [MealFullDesc]
    
    init() {
        self.categories = [Category]()
        self.simpleMealDescriptions = [Meal]()
        self.fullMealDescriptions = [MealFullDesc]()
    }
    
    
}
