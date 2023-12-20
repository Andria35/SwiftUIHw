//
//  NewsComponentView.swift
//  DailyJournal
//
//  Created by Andria Inasaridze on 20.12.23.
//

import SwiftUI

struct NewsComponentView: View {
    
    // MARK: - Properties
    let news: News

    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(news.title)
                Image(systemName: news.isFavourite ? "star.fill" : "star")
                    .foregroundStyle(.yellow)
                Spacer()
                Text(news.date)
            }
            Text(news.news)
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    NewsComponentView(news: News(title: "title", news: "news", date: "10.07.2001"))
}
