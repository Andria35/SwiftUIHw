//
//  News.swift
//  DailyJournal
//
//  Created by Andria Inasaridze on 20.12.23.
//

import Foundation

struct News: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let news: String
    let date: String
    var isFavourite = false
}
