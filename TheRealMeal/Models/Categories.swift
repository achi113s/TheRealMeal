//
//  Categories.swift
//  TheRealMeal
//
//  Created by Giorgio Latour on 7/15/23.
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
