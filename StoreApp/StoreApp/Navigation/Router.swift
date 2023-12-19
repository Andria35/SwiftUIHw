//
//  Router.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 18.12.23.
//

import SwiftUI

final class Router: ObservableObject {
    // MARK: - Properties
    @Published var navigationPath = NavigationPath()
    
    // MARK: - Destination
    public enum Destination: Decodable, Hashable {
        case productsView(category: String, products: [Product])
        case productsDetailsView(product: Product)
    }
    
    // MARK: - Methods
    func navigate(to destination: Destination) {
        navigationPath.append(destination)
    }
    
    func navigateBack() {
        navigationPath.removeLast()
    }
    
    func navigateToRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
}
