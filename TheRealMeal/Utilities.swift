//
//  Utilities.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/3/23.
//

import Foundation

struct Utilities {
    /// A generic utility function for fetching data from an API endpoint.
    /// - Parameter type: A type, T, that conforms to the Decodable protocol.
    /// - Parameter url: The URL of the API endpoint.
    /// - Returns T?: An optional of the generic type T or nil if the fetch fails.
    static public func fetch<T: Decodable>(type: T.Type, from url: URL) async -> T? {
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
    
    /// Filters an array of strings and returns an array of the non-empty strings.
    /// - Parameter arr: An array of strings.
    /// - Returns [String]: The filtered array.
    static public func filterForEmptyStrings(_ arr: Array<String>) -> Array<String> {
        if arr.isEmpty { return arr }
        
        return arr.filter { str in
            let trimmed = str.trimmingCharacters(in: .whitespacesAndNewlines)
            return trimmed != ""
        }
    }
}
