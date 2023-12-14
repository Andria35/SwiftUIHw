//
//  MustSeeDetailsView.swift
//  TravelGuide
//
//  Created by Andria Inasaridze on 13.12.23.
//

import SwiftUI

struct MustSeeDetailsView: View {
    
    // MARK: - Struct Properties
    let mustSeeDetails: MustSeeDetails

    // MARK: - Main Body
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Name: \(mustSeeDetails.name)")
                .font(.title3)
                .fontWeight(.semibold)
            
            HStack {
                Text("Description: \(mustSeeDetails.description)")
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
    MustSeeDetailsView(mustSeeDetails: MustSeeDetails(name: "", description: "", price: nil))
}
