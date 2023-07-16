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
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    AsyncImage(url: mealDetailViewModel.mealFullDesc?.mealThumbnailURL) { imagePhase in
                        if let image = imagePhase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity, maxHeight: 200)
                        } else if imagePhase.error != nil {
                            Image(systemName: "fork.knife")
                                .frame(width: Utilities.thumbnailSize, height: Utilities.thumbnailSize)
                        } else {
                            ProgressView()
                        }
                    }
                    .padding(.bottom)
                    .accessibilityLabel("Image of \(mealName)")
                    
                    if let mealFullDesc = mealDetailViewModel.mealFullDesc {
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Category: \(mealFullDesc.category)")
                            Text("Origin: \(mealFullDesc.origin)")
                            Text("Tags: \(mealFullDesc.tagsFormatted)")
                        }
                    }
                }
                
                if var mealFullDesc = mealDetailViewModel.mealFullDesc {
                    VStack(alignment: .leading, spacing: 3) {
                        Text("Ingredients")
                            .font(.title2)
                            .underline()
                        ForEach(mealFullDesc.ingredientsWithMeasurements, id: \.self) { item in
                            Text("• \(item)")
                        }
                    }
                    .padding(.bottom)

                    VStack(alignment: .leading, spacing: 3) {
                        Text("Instructions")
                            .font(.title2)
                            .underline()
                        Text("\(mealFullDesc.instructions)")
                    }
                }
            }
            .padding([.leading, .trailing])
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
