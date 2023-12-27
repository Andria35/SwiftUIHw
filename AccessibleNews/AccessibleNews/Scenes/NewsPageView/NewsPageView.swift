//
//  NewsPageView.swift
//  AccessibleNews
//
//  Created by Andria Inasaridze on 27.12.23.
//

import SwiftUI
import NetworkManager

struct NewsPageView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: NewsPageViewModel
    @State var sliderValue: Double = 20.0
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("Text size:")
                    .font(.title)
                Slider(value: $sliderValue, in: 10...50, step: 1)
            }
            .padding()
            .accessibilityElement(children: .combine)
            
            UITableViewRepresentable(data: viewModel.articles, fontSize: CGFloat(sliderValue))
        }
    }
}

// MARK: - Preview
#Preview {
    NewsPageView(viewModel: NewsPageViewModel(networkManager: NetworkManager()))
}
