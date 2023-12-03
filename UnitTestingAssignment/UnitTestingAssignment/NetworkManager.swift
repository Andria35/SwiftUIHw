//
//  NetworkManager.swift
//  UnitTestingAssignment
//
//  Created by Baramidze on 02.12.23.
//

import Foundation

protocol NetworkManaging {
    func fetchProducts(completion: @escaping (Result<[Product]?, Error>) -> Void)
}

final class NetworkManager: NetworkManaging {
    
    private let productsUrlString = "https://dummyjson.com/products"
    
    
    // MARK: - Fetch products
    func fetchProducts(completion: @escaping (Result<[Product]?, Error>) -> Void) {
        
        let url = URL(string: productsUrlString)!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let data else {
                completion(.failure(NSError()))
                return
            }
            
            do {
                let productsResponse = try JSONDecoder().decode(ProductsResponse.self, from: data)
                completion(.success(productsResponse.products))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
