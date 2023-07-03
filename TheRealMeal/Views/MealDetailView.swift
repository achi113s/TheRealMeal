//
//  MealView.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/3/23.
//

import SwiftUI

struct MealDetailView: View {
    var meal: Meal
    var mealFull: MealFullDesc?
    
    var body: some View {
        VStack {
            Text(meal.mealName)
        }
        .navigationTitle(meal.mealName)
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(meal: ExampleData.meal)
    }
}
