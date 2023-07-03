//
//  ContentView.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/3/23.
//

import SwiftUI

struct CategoriesView: View {
    private var url: URL? = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")
    
    @State private var categories: [Category] = [Category]()
    private var onlyShowDesserts = true
    
    var body: some View {
        NavigationView {
            List(categories, id: \.id) { category in
                NavigationLink(destination: MealsView(category: category)) {
                    HStack {
                        AsyncImage(url: category.categoryThumbnailURL) { imagePhase in
                            if let image = imagePhase.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            } else if imagePhase.error != nil {
                                Text("Could not load image.")
                            } else {
                                ProgressView()
                            }
                        }
                        
                        VStack {
                            Text("\(category.categoryName)")
                                .font(.title)
                        }
                    }
                }
            }
            .task {
                if let url = url {
                    let downloaded: Categories? = await Utilities.fetchFromTheMealDB(url: url)
                    if let downloaded = downloaded {
                        if onlyShowDesserts {
                            categories = downloaded.categories.filter({ $0.categoryName == "Dessert" })
                        } else {
                            categories = downloaded.categories
                        }
                    }
                }
            }
            .navigationTitle("Meal Categories")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
