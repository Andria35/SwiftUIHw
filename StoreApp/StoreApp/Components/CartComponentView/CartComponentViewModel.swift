//
//  CartComponentViewModel.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 18.12.23.
//

import Foundation

final class CartComponentViewModel: ObservableObject {
    
    // MARK: - Properties
    var checkout: () -> Void
    var basketItemCountIsEmpty: () -> Bool
    
    // MARK: - Initialization
    init(checkout: @escaping () -> Void, basketItemCountIsEmpty: @escaping () -> Bool) {
        self.checkout = checkout
        self.basketItemCountIsEmpty = basketItemCountIsEmpty
    }
}
