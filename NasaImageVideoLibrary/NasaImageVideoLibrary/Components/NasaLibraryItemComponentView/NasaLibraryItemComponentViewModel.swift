//
//  NasaLibraryItemComponentViewModel.swift
//  NasaImageVideoLibrary
//
//  Created by Andria Inasaridze on 03.01.24.
//

import SwiftUI
import NetworkManager

final class NasaLibraryItemComponentViewModel: ObservableObject {
    
    // MARK: - Properties
    let item: NasaLibraryItem
    let networkManager: APIServices
    @Published var itemImage: Image = Image(systemName: "photo")
    @Published var nasaLibraryItemVisuals: NasaLibraryItemVisuals = []

    // MARK: - Initialization
    init(item: NasaLibraryItem, networkManager: APIServices) {
        self.item = item
        self.networkManager = networkManager
        Task {
            await fetchNasaLibraryItemVisuals()
            await fetchImage(urlString: findFirstJPG() ?? "")
        }
    }
    
    // MARK: - Methods
    func findFirstJPG() -> String? {
        nasaLibraryItemVisuals.first { $0.hasSuffix(".jpg") }
    }
    
    // MARK: = API Calls
    private func fetchImage(urlString: String) async {
        do {
            let image = try await networkManager.fetchImage(fromURL: urlString)
            await MainActor.run {
                itemImage =  Image(uiImage: image)
                print("Image downloaded")
            }
        } catch {
            print(error)
        }
    }
    
    private func fetchNasaLibraryItemVisuals() async {
        do {
            let rawVisuals: NasaLibraryItemVisuals = try await networkManager.fetchData(fromURL: item.href)
            await MainActor.run {
                nasaLibraryItemVisuals = rawVisuals.map { urlString in
                    if urlString.hasPrefix("http://") {
                        return urlString.replacingOccurrences(of: "http://", with: "https://")
                    } else {
                        return urlString
                    }
                }
            }
        } catch {
            print(error)
        }
    }
}
