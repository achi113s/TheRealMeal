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
    @State private var searchText = ""
    var filteredMeals: [Meal] {
        if searchText.isEmpty {
            return mealsViewModel.meals
        } else {
            return mealsViewModel.meals.filter( { $0.mealName.contains(searchText) })
        }
    }
    
    var body: some View {
        List(filteredMeals, id: \.id) { meal in
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
                    .accessibilityHidden(true)
                    
                    Text("\(meal.mealName)")
                        .font(.body)
                }
            }
        }
        .task {
            await mealsViewModel.fetchMeals()
        }
        .navigationTitle("\(categoryName)")
        .searchable(text: $searchText, prompt: "e.g. Tart")
    }
    
    init(categoryName: String = "Dessert") {
        self.categoryName = categoryName
        self._mealsViewModel = StateObject(wrappedValue: MealsViewModel(categoryName: categoryName))
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView(categoryName: ExampleData.category.categoryName)
    }
}
