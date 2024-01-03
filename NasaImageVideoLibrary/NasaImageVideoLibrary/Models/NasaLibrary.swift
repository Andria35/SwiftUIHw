//
//  NasaLibrary.swift
//  NasaImageVideoLibrary
//
//  Created by Andria Inasaridze on 03.01.24.
//

import Foundation

import Foundation

// MARK: - NasaLibraryResponse
struct NasaLibraryResponse: Codable {
    let collection: NasaLibrary
}

// MARK: - NasaLibrary
struct NasaLibrary: Codable {
    let items: [NasaLibraryItem]
}

// MARK: - NasaLibraryItem
struct NasaLibraryItem: Codable, Identifiable {
    let id = UUID().uuidString
    let href: String
    let data: [Datum]
    
    enum CodingKeys: String, CodingKey {
        case href, data
    }
}

// MARK: - Datum
struct Datum: Codable {
    let title: String
    let mediaType: MediaType
    let description: String
    let photographer, location: String?

    enum CodingKeys: String, CodingKey {
        case title
        case mediaType = "media_type"
        case description
        case photographer, location
    }
}

enum MediaType: String, Codable {
    case image = "image"
    case video = "video"
    case audio = "audio"
}

