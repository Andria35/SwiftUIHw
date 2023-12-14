//
//  HotelDetailsView.swift
//  TravelGuide
//
//  Created by Andria Inasaridze on 13.12.23.
//

import SwiftUI

struct HotelDetailsView: View {
    
    // MARK: - Struct Properties
    let HotelDetails: HotelDetails

    // MARK: - Main Body
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Name: \(HotelDetails.name)")
                .font(.title3)
                .fontWeight(.semibold)
            
            HStack {
                Text("Description: \(HotelDetails.description)")
                    .font(.title3)
                .fontWeight(.semibold)
                Spacer()
            }
        }
        .padding()
        .background(Color.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .frame(maxWidth: .infinity)
        .padding()
    }
}

// MARK: - Preview
#Preview {
    HotelDetailsView(HotelDetails: HotelDetails(name: "", description: "", price: nil))
}
