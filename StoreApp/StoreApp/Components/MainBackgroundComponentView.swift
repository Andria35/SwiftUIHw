//
//  MainBackgroundComponentView.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 18.12.23.
//

import SwiftUI

struct MainBackgroundComponentView: View {
    
    // MARK: - Body
    var body: some View {
        Color.mainBackgroundColor
            .ignoresSafeArea()
    }
}

// MARK: - Preview
#Preview {
    MainBackgroundComponentView()
}
