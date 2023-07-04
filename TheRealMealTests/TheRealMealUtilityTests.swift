//
//  TheRealMealTests.swift
//  TheRealMealTests
//
//  Created by Giorgio Latour on 7/3/23.
//

import XCTest
@testable import TheRealMeal

final class TheRealMealUtilityTests: XCTestCase {
    // Test static func filterForEmptyStrings(_ arr: Array<String?>) -> Array<String>
    func testSuccessfulEmptyStringsFilter() {
        let testArr: [String?] = ["Beef", "Chicken", " ", "  ", "\n", nil, "Dessert"]
        let expectedResult: [String] = ["Beef", "Chicken", "Dessert"]
        
        let result = Utilities.filterForEmptyStrings(testArr)
        
        XCTAssertEqual(expectedResult, result)
    }
    
    func testEmptyArrayWithEmptyStringsFilter() {
        let testArr: [String?] = []
        let expectedResult: [String] = []
        
        let result = Utilities.filterForEmptyStrings(testArr)
        
        XCTAssertEqual(expectedResult, result)
    }
    
    func testArrayWithNilsEmptyStringsFilter() {
        let testArr: [String?] = [nil, nil, nil, nil]
        let expectedResult: [String] = []
        
        let result = Utilities.filterForEmptyStrings(testArr)
        
        XCTAssertEqual(expectedResult, result)
    }
    
    // Test static func concatenate(firstArray: [String], secondArray: [String], with separator: String) -> [String]
    func testSuccessfulConcatenation() {
        let arrayOne = ["chicken", "flour", "bread crumbs"]
        let arrayTwo = ["2 breasts", "1 cup", "1/2 cup"]
        let expectedResult: [String] = ["chicken, 2 breasts", "flour, 1 cup", "bread crumbs, 1/2 cup"]
        
        let result = Utilities.concatenate(firstArray: arrayOne, secondArray: arrayTwo, with: ", ")
        
        XCTAssertEqual(expectedResult, result)
    }
    
    func testMismatchArraysWithConcatenate() {
        let arrayOne = ["chicken", "flour"]
        let arrayTwo = ["2 breasts", "1 cup", "1/2 cup"]
        let expectedResult: [String] = []
        
        let result = Utilities.concatenate(firstArray: arrayOne, secondArray: arrayTwo, with: ", ")
        
        XCTAssertEqual(expectedResult, result)
    }
}
