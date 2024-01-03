//
//  Router.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 18.12.23.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {
    // MARK: - Properties
    @Published var navigationPath = NavigationPath()
    
    // MARK: - Destination
    public enum Destination: Codable, Hashable {
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

//protocol enumable {
//    associatedtype someEnum: RawRepresentable, Codable, Hashable
//}
//
//class Routerus<Destination: Codable & Hashable>: ObservableObject {
//    // MARK: - Properties
//    @Published var navigationPath = NavigationPath()
//    
//    // MARK: - Methods
//    func navigate(to destination: Destination) {
//        navigationPath.append(destination)
//    }
//    
//    func navigateBack() {
//        navigationPath.removeLast()
//    }
//    
//    func navigateToRoot() {
//        navigationPath.removeLast(navigationPath.count)
//    }
//}
//
//final class Router: Routerus<Router.Destination> {
//    // MARK: - Custom Destination
//    public enum Destination: Codable, Hashable {
//        case productsView(category: String, products: [Product])
//        case productsDetailsView(product: Product)
//    }
//
//}
//
