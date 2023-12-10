//
//  GroceryShopApp.swift
//  GroceryShop
//
//  Created by Andria Inasaridze on 10.12.23.
//

import SwiftUI

@main
struct GroceryShopApp: App {
        
    var body: some Scene {
        WindowGroup {
            GroceryShopView()
                .environmentObject(GroceryShopViewModel())
        }
        
    }
}
