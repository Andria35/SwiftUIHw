//
//  NasaLibraryItemComponentView.swift
//  NasaImageVideoLibrary
//
//  Created by Andria Inasaridze on 03.01.24.
//

import SwiftUI
import NetworkManager

struct NasaLibraryItemComponentView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: NasaLibraryItemComponentViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            viewModel.itemImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 130)
            Text("\(viewModel.item.data.first?.title ?? "")")
                .font(.headline)
                .fontWeight(.bold)
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    NasaLibraryItemComponentView(viewModel: NasaLibraryItemComponentViewModel(item: NasaLibraryItemMockData.nasaLibraryItemImage, networkManager: NetworkManager()))
}
