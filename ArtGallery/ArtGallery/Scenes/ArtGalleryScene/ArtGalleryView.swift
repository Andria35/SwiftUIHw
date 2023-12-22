//
//  ArtGalleryView.swift
//  ArtGallery
//
//  Created by Andria Inasaridze on 22.12.23.
//

import SwiftUI

struct ArtGalleryView: View {
    
    // MARK: - Properties
    @State var longPressGestureAngle = 0.0
    @State var tapGestureAngle = 0.0
    
    @State var magnifyCurrentAmount = CGFloat.zero
    
    @State var rotationCurrentAmount = Angle.zero
    @State var rotationFinalAmount = Angle.zero
    
    @State var dragGestureOffset = CGSize.zero
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color("MainBackground")
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 15) {
                    
                    PaintingComponentView(name: "Bosch")
                        .rotationEffect(Angle(degrees: longPressGestureAngle))
                        .onLongPressGesture {
                            withAnimation(.spring) {
                                longPressGestureAngle += 360
                            }
                        }
                    
                    PaintingComponentView(name: "Botticelli")
                        .scaleEffect(1 + magnifyCurrentAmount)
                        .gesture(
                            MagnifyGesture()
                                .onChanged { amount in
                                    withAnimation {
                                        magnifyCurrentAmount  = amount.magnification - 1
                                    }
                                }
                                .onEnded { amount in
                                    withAnimation {
                                        magnifyCurrentAmount = CGFloat.zero
                                    }
                                }
                        )
                    
                    PaintingComponentView(name: "Caravaggio")
                        .rotationEffect(rotationCurrentAmount + rotationFinalAmount)
                        .gesture(
                            RotateGesture()
                                .onChanged { angle in
                                    withAnimation {
                                        rotationCurrentAmount = angle.rotation
                                    }
                                }
                                .onEnded { amount in
                                    withAnimation {
                                        rotationFinalAmount += rotationCurrentAmount
                                        rotationCurrentAmount = .zero
                                    }
                                }
                            
                        )
                    
                    PaintingComponentView(name: "Vermeer")
                        .offset(dragGestureOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    withAnimation(.spring) {
                                        dragGestureOffset = value.translation
                                        
                                    }
                                }
                                .onEnded { value in
                                    withAnimation(.spring) {
                                        dragGestureOffset = .zero
                                    }
                                }
                            
                        )
                    
                    PaintingComponentView(name: "Picasso")
                        .rotationEffect(Angle(degrees: tapGestureAngle))
                        .onTapGesture {
                            withAnimation {
                                tapGestureAngle -= 180
                            }
                        }
                }
            }
            
        }
    }
}

// MARK: - Preview
#Preview {
    ArtGalleryView()
}
