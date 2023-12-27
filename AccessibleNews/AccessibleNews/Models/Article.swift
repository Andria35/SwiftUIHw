//
//  Article.swift
//  AccessibleNews
//
//  Created by Andria Inasaridze on 27.12.23.
//

import Foundation

// MARK: - NewsResponse
struct ArticleResponse: Decodable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
}

// MARK: - Source
struct Source: Decodable {
    let id: String?
    let name: String
}
