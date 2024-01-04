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
    @State private var isPresented = false
    
    // MARK: - Body
    var body: some View {
        if viewModel.item.data.first?.mediaType == .image {
            imageVStack
        } else if viewModel.item.data.first?.mediaType == .video {
            videoVStack
                .onTapGesture {
                    isPresented.toggle()
                }
                .sheet(isPresented: $isPresented) {
                    VideoPlayerUIViewControllerRepresentable(urlString: viewModel.findFirstMp4() ?? "")
                }
        }
    }
}

// MARK: - Components
extension NasaLibraryItemComponentView {
    
    // MARK: - ImageVStack
    private var imageVStack: some View {
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
    
    // MARK: - VideoVStack
    private var videoVStack: some View {
        VStack(alignment: .leading) {
            ZStack {
                viewModel.itemImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 130)
                Image(systemName: "play.fill")
                    .font(.title)
                    .padding(5)
                    .foregroundStyle(.white)
                    .overlay {
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                    }
            }
            Text("\(viewModel.item.data.first?.title ?? "")")
                .font(.headline)
                .fontWeight(.bold)
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    NasaLibraryItemComponentView(viewModel: NasaLibraryItemComponentViewModel(item: NasaLibraryItemMockData.nasaLibraryItemVideo, networkManager: NetworkManager()))
}
