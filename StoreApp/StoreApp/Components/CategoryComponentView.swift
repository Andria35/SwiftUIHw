//
//  CategoryComponentView.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 17.12.23.
//

import SwiftUI

struct CategoryComponentView: View {
    
    // MARK: - Properties
    let category: String
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.secondaryBackground.opacity(0.7)
            HStack {
                Image(systemName: "list.clipboard.fill")
                Text(category)
                Spacer()
            }
            .padding()
            .foregroundStyle(.white)
            .fontWeight(.semibold)
            .font(.title)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)

    }
}

// MARK: - Preview
#Preview(traits: .sizeThatFitsLayout) {
    CategoryComponentView(category: "laptop")
}
