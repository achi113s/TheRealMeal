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
    
    // favoritedMeals: [String]  = [] use a SET!
    
    /// Filters an array of string optionals and returns an array of unwrapped, non-empty strings.
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
