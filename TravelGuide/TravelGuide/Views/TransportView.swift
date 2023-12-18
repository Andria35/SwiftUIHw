//
//  TransportView.swift
//  TravelGuide
//
//  Created by Andria Inasaridze on 13.12.23.
//

import SwiftUI

struct TransportView: View {
    
    // MARK: - Struct Properties
    let transportDetails: [TransportDetails]

    // MARK: - Main Body
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(transportDetails) { transport in
                        TransportDetailsView(transportDetails: transport)
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
    TransportView(transportDetails: [TransportDetails(name: "Bus", description: "blabla", price: "5$")])
}
