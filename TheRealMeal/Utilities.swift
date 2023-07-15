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

struct ExampleData {
    static let category = Category(
        id: "3",
        categoryName: "Dessert",
        categoryThumbnail: "https://www.themealdb.com/images/category/dessert.png",
        description: """
            Dessert is a course that concludes a meal. The course usually consists of sweet foods,
            such as confections dishes or fruit, and possibly a beverage such as dessert wine or liqueur,
            however in the United States it may include coffee, cheeses, nuts, or other savory items regarded
            as a separate course elsewhere. In some parts of the world, such as much of central and western
            Africa, and most parts of China, there is no tradition of a dessert course to conclude a meal.
            The term dessert can apply to many confections, such as biscuits, cakes, cookies, custards, gelatins,
            ice creams, pastries, pies, puddings, and sweet soups, and tarts. Fruit is also commonly found in dessert
            courses because of its naturally occurring sweetness. Some cultures sweeten foods that are more commonly
            savory to create desserts.
        """
    )
    
    static let meal = Meal(id: "53049", mealName: "Apam balik", mealThumbnail: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
}
