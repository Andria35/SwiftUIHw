//
//  NewsPageViewModel.swift
//  AccessibleNews
//
//  Created by Andria Inasaridze on 27.12.23.
//

import Foundation
import NetworkManager

final class NewsPageViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var articles: [Article] = []
    let networkManager: APIServices
    
    // MARK: - Initialization
    init(networkManager: APIServices) {
        self.networkManager = networkManager
        Task {
            await fetchArticles()
        }
    }
        
    // MARK: - Network Calls
    private func fetchArticles() async {
        let apiKey = "0308b19bc2f44cb6b8ab553823bdda40"
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)"
        do {
            let articlesResponse: ArticleResponse = try await networkManager.fetchData(fromURL: urlString)
            await MainActor.run {
                articles = articlesResponse.articles
            }
        }
        catch {
            print(error)
        }
        
    }
}
