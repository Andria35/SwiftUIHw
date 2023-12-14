//
//  MainScreenViewModel.swift
//  TravelGuide
//
//  Created by Andria Inasaridze on 13.12.23.
//

import Foundation
import NetworkManager
import SwiftUI

final class MainScreenViewModel: ObservableObject {
  
    // MARK: - Class Properties
    @Published var travelDestinations: [TravelDestination] = []
    // ეს path - ის viewModel ში შენახვა რამდენად სწორია არ ვიცი, დიდად ბევრი ვერაფერი ვიპოვე
    // იმის შესახებ სტეკის path - როგორ ვატარო ვიუ ებს შორის, ამიტომ ცალცალკე ვიუებიში
    // Binding ით რომ არ მეთრია ბარემ პირდაპირ აქ დავწერე და vm - ი environment ში ჩავაგდე
    @Published var navigationPath = NavigationPath()
    let travelTips: [String] = [
        "Always pack a towel.",
        "Use a small backpack/suitcase.",
        "Pack light.",
        "take extra socks.",
        "Take an extra bank card and credit card with you",
        "Always visit the local tourism information center.",
        "Take free walking tours.",
        "Don’t be afraid to get purposefully lost."
    ]
    
    // MARK: - Class Methods
    func fetchTravelDestinations() async {
        let urlString = "https://mocki.io/v1/9936f141-345a-4fbf-baae-b7020f998eb4"
        do {
            let travelDestinationResponse: TravelDestinationResponce = try await NetworkManager.shared.fetchData(fromURL: urlString)
            await MainActor.run {
                travelDestinations = travelDestinationResponse.destinations
            }
        } catch {
            print(error)
        }
    }
    
    func fetchImage(urlString: String) async -> Image {
        do {
            let image = try await NetworkManager.shared.fetchImage(fromURL: urlString)
            return Image(uiImage: image)
        } catch {
            print(error)
            return Image(systemName: "photo")
        }
    }
}
