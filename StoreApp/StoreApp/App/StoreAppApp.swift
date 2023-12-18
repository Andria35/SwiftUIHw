//
//  StoreAppApp.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 17.12.23.
//

import SwiftUI

@main
struct StoreAppApp: App {
    
    // MARK: - Properties
    @StateObject var router = Router()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            TabView {
                MainView()
                    .tabItem {
                        Image(systemName: "storefront")
                        Text("Shop")
                    }
                
                NavigationStack(path: $router.navigationPath) {
                    CategoriesView()
                        .navigationDestination(for: Router.Destination.self) { destination in
                            switch destination {
                            case .productsView(let category, let products):
                                ProductsView(viewModel: ProductsViewModel(products: products, category: category))
                            case .productsDetailsView(let product):
                                ProductsDetailsView(viewModel: ProductDetailsViewModel(product: product))
                            }
                        }
                }
                .tabItem {
                    Image(systemName: "menucard.fill")
                    Text("Categories")
                    
                }
                .environmentObject(router)
            }
        }
    }
}
