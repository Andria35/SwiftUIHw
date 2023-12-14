//
//  TravelDestination.swift
//  TravelGuide
//
//  Created by Andria Inasaridze on 13.12.23.
//

import Foundation

struct TravelDestinationResponce: Decodable {
    let destinations: [TravelDestination]
}

struct TravelDestination: Decodable, Identifiable,Hashable {
    
    static func == (lhs: TravelDestination, rhs: TravelDestination) -> Bool {
        lhs.id == rhs.id
    }
    let id = UUID()
    let cityName: String
    let mainImage: String
    let description: String
    let transport: [TransportDetails]
    let mustSee: [MustSeeDetails]
    let hotels: [HotelDetails]

    enum CodingKeys: String, CodingKey {
        case cityName, mainImage, description, transport, mustSee, hotels
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct TransportDetails: Decodable, Identifiable, Hashable {
    let id = UUID()
    
    let name, description: String
    let price: String?
    
    enum CodingKeys: String, CodingKey {
        case name, description, price
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct MustSeeDetails: Decodable, Identifiable, Hashable {
    let id = UUID()
    
    let name, description: String
    let price: String?
    
    enum CodingKeys: String, CodingKey {
        case name, description, price
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
struct HotelDetails: Decodable, Identifiable, Hashable {
    let id = UUID()
    
    let name, description: String
    let price: String?
    
    enum CodingKeys: String, CodingKey {
        case name, description, price
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}



