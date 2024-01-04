//
//  MainPageViewModel.swift
//  NasaImageVideoLibrary
//
//  Created by Andria Inasaridze on 03.01.24.
//

import Foundation
import NetworkManager

final class MainPageViewModel: ObservableObject {
    
    // MARK: - Properties
    let networkManager: APIServices
    @Published var nasaLibraryItems: [NasaLibraryItem] = []
    
    // MARK: - Initialization
    init(networkManager: APIServices) {
        self.networkManager = networkManager
    }
        
    // MARK: - API Calls
    func fetchNasaLibraryItems(searchParameter: String) async {
        let urlString = "https://images-api.nasa.gov/search?q=\(searchParameter)"
        do {
            let nasaLibraryResponse: NasaLibraryResponse = try await networkManager.fetchData(fromURL: urlString)
            await MainActor.run {
                nasaLibraryItems = nasaLibraryResponse.collection.items
                print(nasaLibraryItems.count)
            }
        }
        catch {
            print(error)
        }
    }
}
