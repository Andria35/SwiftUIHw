//
//  goToMainScreenButton.swift
//  TravelGuide
//
//  Created by Andria Inasaridze on 13.12.23.
//

import SwiftUI

struct goToMainScreenButton: View {
    
    // MARK: - Struct Properties
    @EnvironmentObject var viewModel: MainScreenViewModel

    // MARK: - Main Body
    var body: some View {
        Button(action: {
            viewModel.navigationPath.removeLast(viewModel.navigationPath.count)
        }, label: {
            Text("Go To Main Screen")
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        })
    }
}

// MARK: - Preview
#Preview {
    goToMainScreenButton()
        .environmentObject(MainScreenViewModel())
}
