//
//  CartViewModelTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Andria Inasaridze on 03.12.23.
//

import XCTest
@testable import UnitTestingAssignment

final class CartViewModelTests: XCTestCase {
    
    var cartViewModel: CartViewModel!
    
    override func setUpWithError() throws {
        cartViewModel = CartViewModel()
    }
    
    override func tearDownWithError() throws {
        cartViewModel = nil
    }
    
    // 1
    func testAddProductByProduct() {
        // Create a dummy product
        let dummyProduct = Product(id: 1, title: "Test Product", description: "Test Description", price: 10.0, selectedQuantity: 1)
        cartViewModel.addProduct(product: dummyProduct)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.id, dummyProduct.id)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.selectedQuantity, dummyProduct.selectedQuantity)
        
        // add the same product again
        cartViewModel.addProduct(product: dummyProduct)
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        
        // check the updated selected quantity
        XCTAssertEqual(cartViewModel.selectedProducts.first?.selectedQuantity, 2)
    }
    
    // 2
    func testEdgeCaseOfAddProductByProduct() {
        let nilProduct: Product? = nil
        
        cartViewModel.addProduct(product: nilProduct)
        XCTAssertTrue(cartViewModel.selectedProducts.isEmpty)
    }
    
    // 3
    func testAddProductWithID() {
        let dummyProductID = 1
        let dummyProduct = Product(id: dummyProductID, title: "Test Product", description: "Test Description", price: 10.0, selectedQuantity: 1)
        cartViewModel.allProducts = [dummyProduct]
        cartViewModel.addProduct(withID: dummyProductID)
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.id, dummyProductID)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.selectedQuantity, dummyProduct.selectedQuantity)
    }
    
    // 4
    func testAddRandomProduct() {
        let dummyProducts = [
            Product(id: 1, title: "Test Product 1", price: 10.0, selectedQuantity: 1),
            Product(id: 2, title: "Test Product 2", price: 20.0, selectedQuantity: 2),
            Product(id: 3, title: "Test Product 3", price: 30.0, selectedQuantity: 3)
        ]
        
        cartViewModel.allProducts = dummyProducts
        
        cartViewModel.addRandomProduct()
        
        // check if product is added to selectedProducts
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        
        // check if the added product is one of the dummy products
        XCTAssertNotNil(cartViewModel.selectedProducts.first)
        XCTAssertTrue(dummyProducts.contains { $0.id == cartViewModel.selectedProducts.first?.id })
    }
    
    // 5
    func testRemoveProductWithID() {
        let dummyProducts = [
            Product(id: 1, title: "Test Product 1", price: 10.0, selectedQuantity: 1),
            Product(id: 2, title: "Test Product 2", price: 20.0, selectedQuantity: 2),
            Product(id: 3, title: "Test Product 3", price: 30.0, selectedQuantity: 3)
        ]
        cartViewModel.selectedProducts = dummyProducts
        let productIDToRemove = 2
        cartViewModel.removeProduct(withID: productIDToRemove)

        // check if product with the specified ID is removed
        XCTAssertEqual(cartViewModel.selectedProducts.count, dummyProducts.count - 1)
        XCTAssertNil(cartViewModel.selectedProducts.first { $0.id == productIDToRemove })
    }
    
    // 6
    func testClearCart() {
        let dummyProducts = [
            Product(id: 1, title: "Test Product 1", price: 10.0, selectedQuantity: 1),
            Product(id: 2, title: "Test Product 2", price: 20.0, selectedQuantity: 2),
            Product(id: 3, title: "Test Product 3", price: 30.0, selectedQuantity: 3)
        ]
        cartViewModel.selectedProducts = dummyProducts

        cartViewModel.clearCart()

        XCTAssertTrue(cartViewModel.selectedProducts.isEmpty)
    }
    
}
