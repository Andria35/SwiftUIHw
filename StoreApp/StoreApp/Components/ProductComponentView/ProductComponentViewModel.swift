//
//  ProductComponentViewModel.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 18.12.23.
//

import NetworkManager
import SwiftUI

final class ProductComponentViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var productImage: Image = Image(systemName: "photo")
    let product: Product

    
    // MARK: - Closures
    private var addProductToBasket: (Product) -> ()
    private var getQuantityInBasket: (Product) -> Int
    private var reduceItemCount: (Product) -> ()
    private var productInBasket: (Product) -> Bool
    private var deleteProductFromBasket: (Product) -> ()
    
    // MARK: - Initialization
    init(
        product: Product,
        addProductToBasket: @escaping (Product) -> Void,
        getQuantityInBasket: @escaping (Product) -> Int,
        reduceItemCount: @escaping (Product) -> Void,
        productInBasket: @escaping (Product) -> Bool,
        deleteProductFromBasket: @escaping (Product) -> Void
    ) {
        self.product = product
        self.addProductToBasket = addProductToBasket
        self.getQuantityInBasket = getQuantityInBasket
        self.reduceItemCount = reduceItemCount
        self.productInBasket = productInBasket
        self.deleteProductFromBasket = deleteProductFromBasket
        
        Task {
            await fetchImage(urlString: product.images.first ?? "")
        }
        
    }
    
    // MARK: - Methods
    func addProduct() {
        addProductToBasket(product)
    }
    
    func getQuantity() -> Int {
        getQuantityInBasket(product)
    }
    
    func reduceItem() {
        reduceItemCount(product)
    }
    
    func inBasket() -> Bool {
        productInBasket(product)
    }
    
    func deleteProduct() {
        deleteProductFromBasket(product)
    }
    
    // MARK: - Api Calls
    private func fetchImage(urlString: String) async {
        do {
            let image = try await NetworkManager.shared.fetchImage(fromURL: urlString)
            await MainActor.run {
                productImage =  Image(uiImage: image)
            }
        } catch {
            print(error)
        }
    }
}
