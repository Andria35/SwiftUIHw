//
//  ContentView.swift
//  Animations
//
//  Created by Andria Inasaridze on 24.12.23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State private var shouldAnimate = false

    // MARK: - Body
    var body: some View {
        VStack {
            Text("TBC IT Academy")
                .foregroundStyle(shouldAnimate ? .red : .blue)
                .font(.title2)
                .scaleEffect(shouldAnimate ? 1.5 : 1.0)
                .offset(y: shouldAnimate ? -40 : 0)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 2.2).repeatForever(autoreverses: true)) {
                        shouldAnimate.toggle()
                    }
                }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
