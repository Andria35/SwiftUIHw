//
//  HeaderTextComponentView.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 18.12.23.
//

import SwiftUI

struct HeaderTextComponentView: View {
    
    // MARK: - Properties
    let text: String
    
    // MARK: - Body
    var body: some View {
        Text(text)
            .foregroundStyle(Color.headerTextColor.opacity(0.7))
            .font(.title)
            .fontWeight(.bold)
    }
}

// MARK: - Preview
#Preview(traits: .sizeThatFitsLayout) {
    HeaderTextComponentView(text: "Categories")
}
