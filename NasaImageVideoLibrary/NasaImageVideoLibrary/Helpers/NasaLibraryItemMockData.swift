//
//  NasaLibraryItemMockData.swift
//  NasaImageVideoLibrary
//
//  Created by Andria Inasaridze on 03.01.24.
//

import Foundation

struct NasaLibraryItemMockData {
    static let nasaLibraryItemVideo = NasaLibraryItem(
        href: "https://images-assets.nasa.gov/video/KSC-20230507-MH-RLS01-TROPICS_Rocket_Launch-Rocket_Lab-WON_3330130/collection.json",
        data: [Datum(title: "TROPICS Rocket Launch", mediaType: .video, description: "TROPICS Rocket Launch", photographer: "Rocket Lab", location: "Rocket Lab (New Zealand)")])
    
    static let nasaLibraryItemImage = NasaLibraryItem(
        href: "https://images-assets.nasa.gov/image/KSC-20230530-PH-RKL02_0004/collection.json",
        data: [Datum(title: "TROPICS Rocket Launch", mediaType: .image, description: "A Rocket Lab Electron rocket soars upward", photographer: "Rocket Lab", location: "Rocket Lab, New Zealand")])
}
