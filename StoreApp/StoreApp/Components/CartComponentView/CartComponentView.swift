//
//  CartComponentView.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 18.12.23.
//

import SwiftUI

struct CartComponentView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: CartComponentViewModel
    var userBalance: Double
    var basketItemCount: Int
    var basketTotalPrice: Double
    @Binding var isLoading: Bool
    @Binding var showSuccessAlert: Bool
    @Binding var showFailureAlert: Bool

    // MARK: - Body
    var body: some View {
        VStack(alignment:.leading) {
            headerHStack
            balanceHStack
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

// MARK: - Components
extension CartComponentView {
    
    // MARK: - balanceHStack
    private var balanceHStack: some View {
        HStack(alignment: .top) {
            Text("Balance: \(String(format: "%.1f", userBalance))$")
            Spacer()
            VStack(alignment: .leading) {
                Text("Item Count: \(basketItemCount)")
                Text("Total Price: \(String(format: "%.1f", basketTotalPrice))$")
            }
        }
    }
    
    // MARK: - headerHStack
    private var headerHStack: some View {
        HStack {
            Image(systemName: "cart.fill")
                .font(.title)
            
            Spacer()
            
            Button(
                action: {
                    checkoutPressed()
                },
                label: {
                    Text("Checkout")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(Color.secondaryBackgroundColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            )
        }
        .alert("❌Checkout Failed", isPresented: $showFailureAlert) {
        } message: {
            Text("Not Enough Money")
        }
        .alert("✅Checkout Succeeded", isPresented: $showSuccessAlert) {
        } message: {
            Text("Successfully bought!")
        }
    }
    
    // MARK: - checkoutPressed
    private func checkoutPressed() {
        if viewModel.basketItemCountIsEmpty() { return }
        isLoading = true
        viewModel.checkout()
    }

}

// MARK: - Preview
#Preview(traits: .sizeThatFitsLayout) {
    CartComponentView(
        viewModel: CartComponentViewModel(
            checkout: { },
            basketItemCountIsEmpty: { false }
        ),
        userBalance: 0.0,
        basketItemCount: 0,
        basketTotalPrice: 0,
        isLoading: .constant(false),
        showSuccessAlert: .constant(false),
        showFailureAlert: .constant(false)
    )
}
