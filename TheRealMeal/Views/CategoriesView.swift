//
//  ContentView.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/3/23.
//

import SwiftUI

// Thread locking done my MainActor
// NSLocks in ConsciousCart
// HostingController -> memory intensive if you have a lot

struct CategoriesView: View {
    @StateObject var categoriesViewModel: CategoriesViewModel = CategoriesViewModel()
    
    var body: some View {
        NavigationView {
            List(categoriesViewModel.categories, id: \.id) { category in
                NavigationLink(destination: MealsView(categoryName: category.categoryName)) {
                    HStack {
                        AsyncImage(url: category.categoryThumbnailURL) { imagePhase in
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
                        
                        VStack {
                            Text("\(category.categoryName)")
                                .font(.title)
                        }
                        .accessibilityLabel("Show meals in \(category.categoryName) category.")
                    }
                }
            }
            .task {
                await categoriesViewModel.fetchCategories()
            }
            .navigationTitle("TheRealMeal")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
