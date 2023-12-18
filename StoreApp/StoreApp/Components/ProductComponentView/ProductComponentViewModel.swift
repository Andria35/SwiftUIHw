//
//  ProductComponentViewModel.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 18.12.23.
//

import Foundation
import NetworkManager
import SwiftUI

final class ProductComponentViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var productImage: Image = Image(systemName: "photo")
    
    // MARK: - Closures
    var addProductToBasket: (Product) -> ()
    var getQuantityInBasket: (Product) -> Int
    var reduceItemCount: (Product) -> ()
    var productInBasket: (Product) -> Bool
    var deleteProductFromBasket: (Product) -> ()
    
    // MARK: - Initialization
    init(addProductToBasket: @escaping (Product) -> Void, getQuantityInBasket: @escaping (Product) -> Int, reduceItemCount: @escaping (Product) -> Void, productInBasket: @escaping (Product) -> Bool, deleteProductFromBasket: @escaping (Product) -> Void) {
        self.addProductToBasket = addProductToBasket
        self.getQuantityInBasket = getQuantityInBasket
        self.reduceItemCount = reduceItemCount
        self.productInBasket = productInBasket
        self.deleteProductFromBasket = deleteProductFromBasket
    }
    
    // MARK: - Api Calls
    func fetchImage(urlString: String) async{
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
