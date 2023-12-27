//
//  AccessibleNewsApp.swift
//  AccessibleNews
//
//  Created by Andria Inasaridze on 27.12.23.
//

import SwiftUI
import NetworkManager

@main
struct AccessibleNewsApp: App {
    var body: some Scene {
        WindowGroup {
            NewsPageView(viewModel: NewsPageViewModel(networkManager: NetworkManager()))
        }
    }
}
