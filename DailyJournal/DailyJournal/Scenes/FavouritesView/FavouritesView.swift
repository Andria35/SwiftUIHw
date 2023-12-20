//
//  FavouritesView.swift
//  DailyJournal
//
//  Created by Andria Inasaridze on 20.12.23.
//

import SwiftUI

struct FavouritesView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: DailyNewsViewModel

    // MARK: - Body
    var body: some View {
        List(viewModel.favourites) { news in
            NewsComponentView(news: news)
        }
    }
}

// MARK: - Preview
#Preview {
    FavouritesView()
        .environmentObject(DailyNewsViewModel())
}
