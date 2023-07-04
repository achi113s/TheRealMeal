//
//  MealView.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/3/23.
//

import SwiftUI

struct MealDetailView: View {
    var mealID: String
    var mealName: String
    @StateObject var mealDetailViewModel: MealDetailViewModel
    
    var body: some View {
        VStack {
            Text(mealDetailViewModel.mealFullDesc?.mealName ?? mealName)
        }
        .navigationTitle(mealName)
        .task {
            await mealDetailViewModel.fetchMealFullDesc()
        }
    }
    
    init(mealID: String, mealName: String) {
        self.mealID = mealID
        self.mealName = mealName
        self._mealDetailViewModel = StateObject(wrappedValue: MealDetailViewModel(mealID: mealID))
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(mealID: ExampleData.meal.id, mealName: ExampleData.meal.mealName)
    }
}
