//
//  PaintingComponentView.swift
//  ArtGallery
//
//  Created by Andria Inasaridze on 22.12.23.
//

import SwiftUI

struct PaintingComponentView: View {
    
    // MARK: - Properties
    let name: String
    
    // MARK: - Body
    var body: some View {
        Image(name)
            .resizable()
            .frame(width: 300, height: 250)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

// MARK: - Preview
#Preview {
    PaintingComponentView(name: "Botticelli")
}
