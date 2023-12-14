//
//  TravelDestinationView.swift
//  TravelGuide
//
//  Created by Andria Inasaridze on 13.12.23.
//

import SwiftUI

struct TravelDestinationView: View {
    
    // MARK: - Struct Properties
    let travelDestination: TravelDestination
    @EnvironmentObject var viewModel: MainScreenViewModel
    @State var cityImage: Image = Image(systemName: "photo")
    
    // MARK: - Main Body
    var body: some View {
        HStack {
            
            cityImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .task {
                    let fetchedImage = await viewModel.fetchImage(urlString: travelDestination.mainImage)
                    await MainActor.run {
                        cityImage = fetchedImage
                    }
                }
            
            Spacer()
            
            Text(travelDestination.cityName)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding()
    }
}

// MARK: - Preview
#Preview {
    TravelDestinationView(travelDestination: TravelDestination(
        cityName: "Tbilisi",
        mainImage: "https://fastly.picsum.photos/id/43/1280/831.jpg?hmac=glK-rQ0ppFClW-lvjk9FqEWKog07XkOxJf6Xg_cU9LI",
        description: "Tbilisi", transport: [], mustSee: [], hotels: []))
    .environmentObject(MainScreenViewModel())
}
