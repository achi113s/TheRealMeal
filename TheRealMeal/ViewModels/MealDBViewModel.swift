//
//  MealDBViewModel.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/15/23.
//

import Foundation

class MealDBViewModel {
    /// A generic utility function for fetching data from an API endpoint.
    /// - Parameter type: A type, T, that conforms to the Decodable protocol.
    /// - Parameter url: The URL of the API endpoint.
    /// - Returns T?: An optional of the generic type T or nil if the fetch fails.
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
