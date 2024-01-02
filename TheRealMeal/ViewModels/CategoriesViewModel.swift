//
//  CategoriesViewModel.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/3/23.
//

import Foundation

extension CategoriesView {
    @MainActor class CategoriesViewModel: MealDBViewModel, ObservableObject {
        private let url: URL? = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")
        
        @Published var categories: [Category] = [Category]()
        
        private var networkManager: any NetworkManagerProtocol

        // Change to false to show all meal categories.
        private var onlyShowDesserts = true
        
        init(networkManager: any NetworkManagerProtocol = NetworkManager()) {
            self.networkManager = networkManager
        }

        func fetchCategories() async {
            guard let url = url else { return }
            let downloaded: Categories? = await networkManager.fetch(type: Categories.self, from: url)

            if let downloaded {
                categories = if onlyShowDesserts {
                    downloaded.categories.filter({ $0.categoryName == "Dessert" }).sorted()
                } else {
                    downloaded.categories.sorted()
                }
            }
        }
    }
}

class NetworkManager: NetworkManagerProtocol {
    public func fetch<T: Decodable>(type: T.Type, from url: URL) async -> T? {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            let decoder = JSONDecoder()
            let decoded = try decoder.decode(T.self, from: data)
            return decoded
        } catch {
            print("Unable to fetch and decode from \(url.absoluteString): \(error.localizedDescription)")
        }
        return nil
    }
}

protocol NetworkManagerProtocol {
    func fetch<T: Decodable>(type: T.Type, from url: URL) async -> T?
}
