//
//  TravelGuideApp.swift
//  TravelGuide
//
//  Created by Andria Inasaridze on 13.12.23.
//

import SwiftUI

@main
struct TravelGuideApp: App {
    
    @StateObject var viewModel = MainScreenViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $viewModel.navigationPath) {
                MainScreenView()
            }
            .environmentObject(viewModel)
        }
    }
}
