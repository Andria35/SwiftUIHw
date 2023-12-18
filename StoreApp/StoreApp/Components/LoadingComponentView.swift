//
//  LoadingComponentView.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 18.12.23.
//

import SwiftUI

struct LoadingComponentView: View {
    
    // MARK: - Properties
    @Binding var isLoading: Bool
    
    // MARK: - Body
    var body: some View {
        ProgressView()
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isLoading = false
                }
            }
    }
}

// MARK: - Preview
#Preview {
    LoadingComponentView(isLoading: .constant(true))
}
