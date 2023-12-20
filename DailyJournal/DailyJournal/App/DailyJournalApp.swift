//
//  DailyJournalApp.swift
//  DailyJournal
//
//  Created by Andria Inasaridze on 20.12.23.
//

import SwiftUI

@main
struct DailyJournalApp: App {
    // MARK: - Properties
    @StateObject var viewModel = DailyNewsViewModel()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TabView {
                    DailyNewsView()
                        .tabItem {
                            Image(systemName: "list.clipboard")
                            Text("Daily News")
                        }
                    FavouritesView()
                        .tabItem {
                            Image(systemName: "star.fill")
                            Text("Favourites")
                        }
                }
                .environmentObject(viewModel)
            }
        }
    }
}
