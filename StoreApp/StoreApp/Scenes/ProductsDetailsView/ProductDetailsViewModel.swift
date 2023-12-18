//
//  ProductDetailsViewModel.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 18.12.23.
//

import Foundation
import SwiftUI
import NetworkManager

final class ProductDetailsViewModel: ObservableObject {
    
    // MARK: - Properties
    let product: Product
    @Published var productImage: Image = Image(systemName: "photo")
    
    // MARK: - Initialization
    init(product: Product) {
        self.product = product
        Task {
            await fetchImage(urlString: product.images.first ?? "")
        }
    }
    
    // MARK: - Api Calls
    private func fetchImage(urlString: String) async{
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
