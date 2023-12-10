//
//  GroceryShopViewModel.swift
//  GroceryShop
//
//  Created by Andria Inasaridze on 10.12.23.
//

import Foundation
import SwiftUI


final class GroceryShopViewModel: ObservableObject {
    
    // MARK: - Class Properties
    @Published var products = [
        Product(name: "Apple", image: Image("Apple"), price: "10.0", availableQuantityInStock: 10),
        Product(name: "Banana", image: Image("Banana"), price: "10.0", availableQuantityInStock: 10),
        Product(name: "Bread", image: Image("Bread"), price: "10.0", availableQuantityInStock: 10),
        Product(name: "Chocolate", image: Image("Chocolate"), price: "10.0", availableQuantityInStock: 10),
        Product(name: "Coffe", image: Image("Coffe"), price: "10.0", availableQuantityInStock: 10),
        Product(name: "Orange", image: Image("Orange"), price: "10.0", availableQuantityInStock: 10),
        Product(name: "Strawberry", image: Image("Strawberry"), price: "10.0", availableQuantityInStock: 10),
        Product(name: "Water", image: Image("Water"), price: "10.0", availableQuantityInStock: 10),
    ]
    
    @Published var basket: [Product] = []
    
    var basketItemCount: Int {
        basket.reduce(0) { $0 + $1.quantityInBasket }
    }
    
    var basketTotalPrice: Double {
        basket.reduce(0.0) { $0 + ((Double($1.price) ?? 0) * Double($1.quantityInBasket)) }
    }
    
    //MARK: - Class Methods
    func addProductToBasket(_ product: Product) {
        if product.availableQuantityInStock == 0 {
            return
        }

        decreaseProductStockCount(product: product)
        
        if let index = basket.firstIndex(where: { $0.id == product.id }) {
            basket[index].quantityInBasket += 1
        } else {
            basket.append(product)
        }
    }
    
    private func decreaseProductStockCount(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].availableQuantityInStock -= 1
        }
    }
        
    func reduceItemCount(for product: Product) {
        guard let index = basket.firstIndex(where: { $0.id == product.id }) else { return }
        increaseProductStockCount(product: product)
        
        if basket[index].quantityInBasket == 1 {
            basket.remove(at: index)
        } else {
            basket[index].quantityInBasket -= 1
        }
    }
    
    private func increaseProductStockCount(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].availableQuantityInStock += 1
        }
    }

    func deleteProductFromBasket(_ product: Product) {
        basket.removeAll(where: {$0.id == product.id})
        
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].availableQuantityInStock = product.quantityInStock
        }
    }
    
    func applySale() {
        
        for index in products.indices {
            let originalPrice = (Double(products[index].price) ?? 0.0)
            let discountedPrice = originalPrice * 0.8 // 20% off
            products[index].price = String(format: "%.1f", discountedPrice)
        }
        
        for index in basket.indices {
            let originalPrice = (Double(basket[index].price) ?? 0.0)
            let discountedPrice = originalPrice * 0.8 // 20% off
            basket[index].price = String(format: "%.1f", discountedPrice)
        }
    }
}
