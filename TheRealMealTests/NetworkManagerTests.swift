//
//  NetworkManagerTests.swift
//  TheRealMealTests
//
//  Created by Giorgio Latour on 11/28/23.
//

import XCTest
@testable import TheRealMeal
// can also mark as async
@MainActor final class NetworkManagerTests: XCTestCase {

    private var networkManager: NetworkManagerForTesting!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        networkManager = NetworkManagerForTesting()
    }

    // receive different JSON from network
    func testReceivedSuccessfulJSON() async {
        let viewModel = CategoriesView.CategoriesViewModel(networkManager: networkManager)
        await viewModel.fetchCategories()

        let testArr: Categories = Categories(categories: [Category(id: "1", categoryName: "Dessert", categoryThumbnail: "image", description: "sweet")])
        XCTAssertEqual(viewModel.categories, testArr.categories, "Categories test failed.")
    }
}

class NetworkManagerForTesting: NetworkManagerProtocol {
    func fetch<T>(type: T.Type, from url: URL) async -> T? where T : Decodable {
        return Categories(categories: [Category(id: "1", categoryName: "Dessert", categoryThumbnail: "image", description: "sweet")]) as! T
    }
}
