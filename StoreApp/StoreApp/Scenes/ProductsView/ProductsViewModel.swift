//
//  ProductsViewModel.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 18.12.23.
//

import Foundation

final class ProductsViewModel: ObservableObject {
    
    // MARK: - Properties
    private let products: [Product]
    private let category: String
    
    @Published var categoryProduct: [Product] = []
    @Published var basket: [Product] = []
    @Published var userBalance: Double = 5000
    @Published var showSuccessAlert: Bool = false
    @Published var showFailureAlert: Bool = false
    
    var basketItemCount: Int {
        basket.reduce(0) { $0 + $1.quantityInBasket }
    }
    
    var basketTotalPrice: Double {
        basket.reduce(0.0) { $0 + ((Double($1.price)) * Double($1.quantityInBasket)) }
    }

    // MARK: - Initialization
    init(products: [Product], category: String) {
        self.products = products
        self.category = category
        filterProductsByCategory()
    }
    
    // MARK: - Methods
    private func filterProductsByCategory() {
        categoryProduct = products.filter { $0.category == category }
    }
    
    func addProductToBasket(_ product: Product) {
        if let index = basket.firstIndex(where: { $0.id == product.id }) {
            basket[index].quantityInBasket += 1
        } else {
            basket.append(product)
        }
    }
    
    func productInBasket(_ product: Product) -> Bool {
        basket.contains { $0.id == product.id }
    }
    
    func reduceItemCount(for product: Product) {
        guard let index = basket.firstIndex(where: { $0.id == product.id }) else { return }
        
        if basket[index].quantityInBasket == 1 {
            basket.remove(at: index)
        } else {
            basket[index].quantityInBasket -= 1
        }
    }
    
    func getQuantityInBasket(for product: Product) -> Int {
        if let index = basket.firstIndex(where: { $0.id == product.id }) {
            return basket[index].quantityInBasket
        } else {
            return 0
        }
    }
    
    func deleteProductFromBasket(_ product: Product) {
        basket.removeAll(where: {$0.id == product.id})
    }
        
    func checkout() {
        if balanceIsEnough() {
            makePurchase()
            showSuccessAlert.toggle()
        } else {
            showFailureAlert.toggle()
        }
    }
    
    func basketItemCountIsEmpty() -> Bool {
        basketItemCount == 0 ? true : false
    }
    
    private func balanceIsEnough() -> Bool {
        userBalance < basketTotalPrice ? false : true
    }
    
    private func makePurchase() {
        userBalance -= basketTotalPrice
        basket.removeAll()
    }
    
}
