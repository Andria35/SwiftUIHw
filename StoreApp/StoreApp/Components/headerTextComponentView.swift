//
//  headerTextComponentView.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 18.12.23.
//

import SwiftUI

struct headerTextComponentView: View {
    
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
#Preview {
    headerTextComponentView(text: "Categories")
}
