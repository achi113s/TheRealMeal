//
//  Meals.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/3/23.
//

import Foundation

struct Categories: Codable {
    var categories: [Category]
}

struct Category: Identifiable, Codable, Comparable {
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case categoryName = "strCategory"
        case categoryThumbnail = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
    
    var id: String
    var categoryName: String
    var categoryThumbnail: String
    var categoryThumbnailURL: URL? {
        return URL(string: categoryThumbnail)
    }
    var description: String
    
    static func <(lhs: Category, rhs: Category) -> Bool {
        return lhs.categoryName < rhs.categoryName
    }
}

struct Meals: Codable {
    var meals: [Meal]
}

struct Meal: Identifiable, Codable, Comparable {
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case mealName = "strMeal"
        case mealThumbnail = "strMealThumb"
    }
    
    var id: String
    var mealName: String
    var mealThumbnail: String
    var mealThumbnailURL: URL? {
        return URL(string: mealThumbnail)
    }
    
    static func <(lhs: Meal, rhs: Meal) -> Bool {
        return lhs.mealName < rhs.mealName
    }
}

struct MealFullDescs: Codable {
    var meals: [MealFullDesc]
}

struct MealFullDesc: Identifiable, Codable {
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case mealName = "strMeal"
        case drinkAlternate = "strDrinkAlternate"
        case category = "strCategory"
        case origin = "strArea"
        case instructions = "strInstructions"
        case mealThumbnail = "strMealThumb"
        case tags = "strTags"
        case youtube = "strYoutube"
        
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        
        case measurement1 = "strMeasure1"
        case measurement2 = "strMeasure2"
        case measurement3 = "strMeasure3"
        case measurement4 = "strMeasure4"
        case measurement5 = "strMeasure5"
        case measurement6 = "strMeasure6"
        case measurement7 = "strMeasure7"
        case measurement8 = "strMeasure8"
        case measurement9 = "strMeasure9"
        case measurement10 = "strMeasure10"
        case measurement11 = "strMeasure11"
        case measurement12 = "strMeasure12"
        case measurement13 = "strMeasure13"
        case measurement14 = "strMeasure14"
        case measurement15 = "strMeasure15"
        case measurement16 = "strMeasure16"
        case measurement17 = "strMeasure17"
        case measurement18 = "strMeasure18"
        case measurement19 = "strMeasure19"
        case measurement20 = "strMeasure20"
        
        case source = "strSource"
        case imageSource = "strImageSource"
        case creativeCommonsConfirmed = "strCreativeCommonsConfirmed"
    }
    
    var id: String
    var mealName: String
    var drinkAlternate: String?
    var category: String
    var origin: String
    var instructions: String
    var mealThumbnail: String
    var mealThumbnailURL: URL? {
        return URL(string: mealThumbnail)
    }
    var tags: String?
    var tagsFormatted: String {
        guard let tags = tags else { return "" }
        return tags.split(separator: ",").joined(separator: ", ")
    }
    var youtube: String
    var youtubeURL: URL? {
        return URL(string: youtube)
    }
    
    var ingredient1: String?
    var ingredient2: String?
    var ingredient3: String?
    var ingredient4: String?
    var ingredient5: String?
    var ingredient6: String?
    var ingredient7: String?
    var ingredient8: String?
    var ingredient9: String?
    var ingredient10: String?
    var ingredient11: String?
    var ingredient12: String?
    var ingredient13: String?
    var ingredient14: String?
    var ingredient15: String?
    var ingredient16: String?
    var ingredient17: String?
    var ingredient18: String?
    var ingredient19: String?
    var ingredient20: String?
    var ingredients: [String] {
        let allIngredients = [ingredient1, ingredient2, ingredient3, ingredient4,
                              ingredient5, ingredient6, ingredient7, ingredient8,
                              ingredient9, ingredient10, ingredient11, ingredient12,
                              ingredient13, ingredient14, ingredient15, ingredient16,
                              ingredient17, ingredient18, ingredient19, ingredient20]
        return Utilities.filterForEmptyStrings(allIngredients)
    }

    var measurement1: String?
    var measurement2: String?
    var measurement3: String?
    var measurement4: String?
    var measurement5: String?
    var measurement6: String?
    var measurement7: String?
    var measurement8: String?
    var measurement9: String?
    var measurement10: String?
    var measurement11: String?
    var measurement12: String?
    var measurement13: String?
    var measurement14: String?
    var measurement15: String?
    var measurement16: String?
    var measurement17: String?
    var measurement18: String?
    var measurement19: String?
    var measurement20: String?
    var measurements: [String] {
        let allMeasurements = [measurement1, measurement2, measurement3, measurement4,
                               measurement5, measurement6, measurement7, measurement8,
                               measurement9, measurement10, measurement11, measurement12,
                               measurement13, measurement14, measurement15, measurement16,
                               measurement17, measurement18, measurement19, measurement20]
        return Utilities.filterForEmptyStrings(allMeasurements)
    }
    
    var ingredientsWithMeasurements: [String] {
        return Utilities.concatenate(firstArray: measurements, secondArray: ingredients, with: ", ")
    }
    
    var source: String?
    var sourceURL: URL? {
        guard let source = source else { return nil }
        return URL(string: source)
    }
    var imageSource: String?
    var imageSourceURL: URL? {
        guard let imageSource = imageSource else { return nil }
        return URL(string: imageSource)
    }
    var creativeCommonsConfirmed: String?
    var dateModified: String?
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
