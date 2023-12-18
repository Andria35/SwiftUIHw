//
//  CategoriesViewModel.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 17.12.23.
//

import Foundation
import NetworkManager

final class CategoriesViewModel: ObservableObject {
    // MARK: - Properties
    @Published var products: [Product] = []
    var uniqueCategories: [String] {
        let uniqueCategories = Set(products.map { $0.category })
        return Array(uniqueCategories)
    }
    
    // MARK: - Initialization
    init() {
        Task {
            await fetchProducts()
        }
    }
    
    // MARK: - Network Calls
    func fetchProducts() async {
        let urlString = "https://dummyjson.com/products"
        do {
            let productsResponse: ProductsResponse = try await NetworkManager.shared.fetchData(fromURL: urlString)
            await MainActor.run {
                products = productsResponse.products
            }
        } catch {
            print(error)
        }
    }
}
