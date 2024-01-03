//
//  NasaImageVideoLibraryApp.swift
//  NasaImageVideoLibrary
//
//  Created by Andria Inasaridze on 03.01.24.
//

import SwiftUI
import NetworkManager

@main
struct NasaImageVideoLibraryApp: App {
    var body: some Scene {
        WindowGroup {
            MainPageView(viewModel: MainPageViewModel(networkManager: NetworkManager()))
        }
    }
}
