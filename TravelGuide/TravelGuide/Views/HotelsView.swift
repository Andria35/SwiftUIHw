//
//  HotelsView.swift
//  TravelGuide
//
//  Created by Andria Inasaridze on 13.12.23.
//

import SwiftUI

struct HotelsView: View {
    
    // MARK: - Struct Properties
    let hotelDetails: [HotelDetails]

    // MARK: - Main Body
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(hotelDetails) { hotel in
                        HotelDetailsView(HotelDetails: hotel)
                    }
                }
            }
            goToMainScreenButton()
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    HotelsView(hotelDetails: [HotelDetails(name: "", description: "", price: nil)])
}
