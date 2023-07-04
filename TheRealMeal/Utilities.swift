//
//  Utilities.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/3/23.
//

import Foundation

struct Utilities {
    /// Dimension for the thumbnail images.
    static let thumbnailSize: CGFloat = 50
    
    /// Concatenates the elements of two arrays of strings of length n into a single array of length n using a given separator.
    /// - Parameter firstArray: [String]
    /// - Parameter secondArray: [String]
    /// - Parameter with separator: String
    static public func concatenate(firstArray: [String], secondArray: [String], with separator: String) -> [String] {
        let firstCount = firstArray.count
        guard firstCount == secondArray.count else { return [String]() }
        
        var newArr = [String]()
        
        for i in stride(from: 0, to: firstCount, by: 1) {
            let newStr = firstArray[i] + separator + secondArray[i]
            newArr.append(newStr)
        }
        
        return newArr
    }
    
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
    
    /// Filters an array of string options and returns an array of unwrapped, non-empty strings.
    /// - Parameter arr: An array of string optionals.
    /// - Returns [String]: The filtered array.
    static public func filterForEmptyStrings(_ arr: Array<String?>) -> Array<String> {
        if arr.isEmpty { return [String]() }
        
        let noOpts = arr.compactMap({ $0 })
        
        return noOpts.filter { str in
            let trimmed = str.trimmingCharacters(in: .whitespacesAndNewlines)
            return trimmed != ""
        }
    }
}
