//
//  Product.swift
//  GroceryShop
//
//  Created by Andria Inasaridze on 10.12.23.
//

import Foundation
import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let image: Image
    var price: String
    var availableQuantityInStock: Int
    let quantityInStock: Int
    var quantityInBasket: Int = 1
    
    init(name: String, image: Image, price: String, availableQuantityInStock: Int) {
        self.name = name
        self.image = image
        self.price = price
        self.availableQuantityInStock = availableQuantityInStock
        self.quantityInStock = availableQuantityInStock
    }
    
}
