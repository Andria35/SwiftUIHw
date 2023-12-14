//
//  MainScreenView.swift
//  TravelGuide
//
//  Created by Andria Inasaridze on 13.12.23.
//

import SwiftUI

struct MainScreenView: View {
    
    // MARK: - Struct Properties
    @State var showAlerts: Bool = false
    @EnvironmentObject var viewModel: MainScreenViewModel
    
    // MARK: - Main Body
    var body: some View {
        VStack {
            citiesScrollView
            travelTipsButton
        }
        .padding()
    }
}

// MARK: - MainScreenView UI Components
extension MainScreenView {
    
    var citiesScrollView: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.travelDestinations) { destination in
                    
                    NavigationLink(value: destination) {
                        TravelDestinationView(travelDestination: destination)
                    }
                }
            }
            .navigationDestination(for: TravelDestination.self) { travelDestination in
                DestinationDetailsView(travelDestination: travelDestination)
            }
        }
        .task {
            await viewModel.fetchTravelDestinations()
    }

    }
    
    var travelTipsButton: some View {
        Button(action: {
            showAlerts.toggle()
        }, label: {
            Text("Travel Tips")
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 20))

        })
        .alert("Travel Tip", isPresented: $showAlerts) {
            Text("Ok")
        } message: {
            Text(viewModel.travelTips.randomElement() ?? "")
        }
    }
}

// MARK: - Preview
#Preview {
    NavigationStack{
        MainScreenView()
    }
    .environmentObject(MainScreenViewModel())
}
