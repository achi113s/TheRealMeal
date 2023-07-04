//
//  TheRealMealTests.swift
//  TheRealMealTests
//
//  Created by Giorgio Latour on 7/3/23.
//

import XCTest
@testable import TheRealMeal

final class TheRealMealTests: XCTestCase {
    func testSuccessfulEmptyStringsFilter() {
        let testArr: [String] = ["Beef", "Chicken", " ", "  ", "\n", "Dessert"]
        let expectedResult: [String] = ["Beef", "Chicken", "Dessert"]
        
        let result = Utilities.filterForEmptyStrings(testArr)
        
        XCTAssertEqual(expectedResult, result)
    }
    
    func testEmptyArrayWithEmptyStringsFilter() {
        let testArr: [String] = []
        let expectedResult: [String] = []
        
        let result = Utilities.filterForEmptyStrings(testArr)
        
        XCTAssertEqual(expectedResult, result)
    }
}
