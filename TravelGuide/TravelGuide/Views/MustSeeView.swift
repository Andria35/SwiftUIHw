//
//  MustSeeView.swift
//  TravelGuide
//
//  Created by Andria Inasaridze on 13.12.23.
//

import SwiftUI

struct MustSeeView: View {
    
    // MARK: - Struct Properties
    let mustSeeDetails: [MustSeeDetails]

    // MARK: - Main Body
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(mustSeeDetails) { mustSee in
                        MustSeeDetailsView(mustSeeDetails: mustSee)
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
    MustSeeView(mustSeeDetails: [MustSeeDetails(name: "bla", description: "asdas", price: nil)])
}
