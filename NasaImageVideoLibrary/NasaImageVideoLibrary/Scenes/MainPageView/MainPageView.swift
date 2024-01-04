//
//  MainPageView.swift
//  NasaImageVideoLibrary
//
//  Created by Andria Inasaridze on 03.01.24.
//

import SwiftUI
import NetworkManager

struct MainPageView: View {
    
    // MARK: - Properties
    private let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @StateObject var viewModel: MainPageViewModel
    @State var textFieldText: String = ""
    
    // MARK: - Body
    var body: some View {
        VStack {
            searchTextField
            if !viewModel.nasaLibraryItems.isEmpty {
                ScrollView {
                    nasaLibraryItemsGrid
                }
            }
            Spacer()
        }
    }
}

// MARK: - Components
extension MainPageView {
    // MARK: - SearchTextField
    private var searchTextField: some View {
        TextField("Search", text: $textFieldText, onCommit: {
            print("Enter Presssed")
            Task {
                await viewModel.fetchNasaLibraryItems(searchParameter: textFieldText)
            }
        })
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding()
    }
    
    private var nasaLibraryItemsGrid: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(viewModel.nasaLibraryItems) { item in
                NasaLibraryItemComponentView(viewModel: NasaLibraryItemComponentViewModel(item: item, networkManager: NetworkManager()))
            }
        }
    }
}

// MARK: - Preview
#Preview {
    MainPageView(viewModel: MainPageViewModel(networkManager: NetworkManager()))
}
