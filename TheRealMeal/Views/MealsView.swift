//
//  MealsView.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/3/23.
//

import SwiftUI

struct MealsView: View {
    var categoryName: String
    @StateObject var mealsViewModel: MealsViewModel
    
    var body: some View {
        List(mealsViewModel.meals, id: \.id) { meal in
            NavigationLink(destination: MealDetailView(mealID: meal.id, mealName: meal.mealName)) {
                HStack {
                    AsyncImage(url: meal.mealThumbnailURL) { imagePhase in
                        if let image = imagePhase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: Utilities.thumbnailSize, height: Utilities.thumbnailSize)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } else if imagePhase.error != nil {
                            Image(systemName: "fork.knife")
                                .frame(width: Utilities.thumbnailSize, height: Utilities.thumbnailSize)
                        } else {
                            ProgressView()
                        }
                    }
                    Text("\(meal.mealName)")
                        .font(.body)
                }
            }
        }
        .task {
            await mealsViewModel.fetchMeals()
        }
        .navigationTitle("\(categoryName)")
    }
    
    init(categoryName: String = "Dessert") {
        self.categoryName = categoryName
        self._mealsViewModel = StateObject(wrappedValue: MealsViewModel(categoryName: categoryName))
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView(categoryName: "Dessert")
    }
}
