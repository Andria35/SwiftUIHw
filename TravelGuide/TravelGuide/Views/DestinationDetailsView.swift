//
//  DestinationDetailsView.swift
//  TravelGuide
//
//  Created by Andria Inasaridze on 13.12.23.
//

import SwiftUI

struct DestinationDetailsView: View {
    
    // MARK: - Struct Properties
    @EnvironmentObject var viewModel: MainScreenViewModel
    @State var destinationImage = Image(systemName: "photo")
    let travelDestination: TravelDestination
    
    // MARK: - Main Body
    var body: some View {
        VStack {
            // აქ წესით რამე სხვა ფოტოს უნდა ვიწერდე მარა იგივეს გადმოვწერ ბარემ
            // რაც წინა ვიუში რო mock api შეცვლა არ მომიწიოს ამისთვის
            destinationImageView
            destinationDescriptionView
            navigationVStack
            Spacer()
        }
        .padding()
    }
}

// MARK: - DestinationDetailsView UI Components
extension DestinationDetailsView {
    
    var destinationImageView: some View {
        destinationImage
            .resizable()
            .frame(width: 300, height: 200)
            .task {
                let fetchedImage = await viewModel.fetchImage(urlString: travelDestination.mainImage)
                await MainActor.run {
                    destinationImage = fetchedImage
                }
            }

    }
    
    var destinationDescriptionView: some View {
        Text(travelDestination.description)
            .font(.title3)
            .fontWeight(.semibold)
    }
    
    var navigationVStack: some View {
        VStack {
            NavigationLink(value: travelDestination.transport) {
                Text("Transport")
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            NavigationLink(value: travelDestination.mustSee) {
                Text("Must See")
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            NavigationLink(value: travelDestination.hotels) {
                Text("Hotels")
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
        }
        .navigationDestination(for: [TransportDetails].self) { transportDestination in
            TransportView(transportDetails: transportDestination)
        }
        .navigationDestination(for: [MustSeeDetails].self) { mustSeeDetails in
            MustSeeView(mustSeeDetails: mustSeeDetails)
        }
        .navigationDestination(for: [HotelDetails].self) { hotelDetails in
            HotelsView(hotelDetails: hotelDetails)
        }

    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        DestinationDetailsView(travelDestination: TravelDestination(
            cityName: "Tbilisi",
            mainImage: "https://fastly.picsum.photos/id/43/1280/831.jpg?hmac=glK-rQ0ppFClW-lvjk9FqEWKog07XkOxJf6Xg_cU9LI",
            description: "Tbilisi Is Good", transport: [], mustSee: [], hotels: []))
    }
    .environmentObject(MainScreenViewModel())
}
