//
//  Product.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 17.12.23.
//

import Foundation

// MARK: - ProductsResponse
struct ProductsResponse: Decodable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Decodable, Identifiable, Hashable {
    var quantityInBasket: Int = 1
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, price, discountPercentage, rating, stock,
        brand, category, thumbnail, images
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
