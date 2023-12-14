//
//  TransportDetailsView.swift
//  TravelGuide
//
//  Created by Andria Inasaridze on 13.12.23.
//

import SwiftUI

struct TransportDetailsView: View {
    
    // MARK: - Struct Properties
    let transportDetails: TransportDetails
    
    // MARK: - Main Body
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text("Name: \(transportDetails.name)")
                Spacer()
                Text("Price: " + (transportDetails.price ?? ""))
                    .opacity(0.5)
            }
            .font(.title3)
            .fontWeight(.semibold)

            
            Text("Description: \(transportDetails.description)")
                .font(.title3)
                .fontWeight(.semibold)
        }
        .padding()
        .background(Color.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding()
    }
}

// MARK: - Preview
#Preview {
    TransportDetailsView(transportDetails: TransportDetails(name: "Bus", description: "BlaBla", price: "5$"))
}
