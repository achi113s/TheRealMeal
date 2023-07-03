//
//  MealsView.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/3/23.
//

import SwiftUI

struct MealsView: View {
    var category: Category
    private var url: URL? {
        return URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=\(category.categoryName)")
    }
    
    @State private var meals: [Meal] = [Meal]()
    
    var body: some View {
        List(meals, id: \.id) { meal in
            NavigationLink(destination: MealDetailView(meal: meal)) {
                HStack {
                    AsyncImage(url: meal.mealThumbnailURL) { imagePhase in
                        if let image = imagePhase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } else if imagePhase.error != nil {
                            Image(systemName: "basket")
                                .frame(width: 50, height: 50)
                        } else {
                            ProgressView()
                        }
                    }
                    Text("\(meal.mealName)")
                }
            }
        }
        .task {
            if let url = url {
                let downloaded: Meals? = await Utilities.fetchFromTheMealDB(url: url)
                if let downloaded = downloaded {
                    meals = downloaded.meals.sorted()
                }
            }
        }
        .navigationTitle("\(category.categoryName)")
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView(category: ExampleData.category)
    }
}
