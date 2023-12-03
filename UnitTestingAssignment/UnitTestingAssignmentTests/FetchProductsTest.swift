//
//  FetchProductsTest.swift
//  UnitTestingAssignmentTests
//
//  Created by Andria Inasaridze on 03.12.23.
//

import XCTest
@testable import UnitTestingAssignment


final class FetchProductsTest: XCTestCase {
    // 7
    func testFetchProducts() {
        
        let expectation = XCTestExpectation(description: "Fetch products")

        let networkManager = NetworkManager()
        let cartViewModel = CartViewModel(networkManager: networkManager)

        let mockNetworkManager = MockNetworkManager()
        let mockCartViewModel = CartViewModel(networkManager: mockNetworkManager)
        
        cartViewModel.fetchProducts()
        mockCartViewModel.fetchProducts()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5.0)

        XCTAssertEqual(cartViewModel.allProducts?.count, 30)
        XCTAssertEqual(mockCartViewModel.allProducts?.count, 15)
        
        // check that fetchProducts Call is not duplicated
        XCTAssertEqual(mockNetworkManager.fetchProductsCallCounter, 1)
    }
    
    class MockNetworkManager: NetworkManaging {
        
        var fetchProductsCallCounter = 0
        
        func fetchProducts(completion: @escaping (Result<[Product]?, Error>) -> Void) {
            fetchProductsCallCounter += 1
            let response = ProductsResponse.dummyProducts
            completion(.success(response))
        }
    }

}
