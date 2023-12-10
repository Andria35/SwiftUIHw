//
//  GroceryShopView.swift
//  GroceryShop
//
//  Created by Andria Inasaridze on 10.12.23.
//

import SwiftUI

struct GroceryShopView: View {
    
    // MARK: - Struct Properties
    @EnvironmentObject private var viewModel: GroceryShopViewModel

    // MARK: - Main Body
    var body: some View {
        VStack {
            listView
            
            myBasketView
            
            getSaleButton
        }
        .padding(.vertical)
    }
}

// MARK: - GroceryShopView Components
extension GroceryShopView {
    
    var listView: some View {
        List(viewModel.products) { product in
            ProductView(product: product)
        }
        .listStyle(.plain)
    }
    
    var myBasketView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("My Basket")
                Image(systemName: "cart")
            }
            .font(.headline)
            HStack {
                Text("Item Count: \(viewModel.basketItemCount)")
                Spacer()
                Text("Total Price: \(String(format: "%.1f", viewModel.basketTotalPrice))$")
            }
            .font(.title3)
        }
        .padding()

    }
    
    var getSaleButton: some View {
        Button(action: {
            viewModel.applySale()
        }, label: {
            Text("Get Sale")
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
}

// MARK: - Preview
#Preview {
    GroceryShopView()
        .environmentObject(GroceryShopViewModel())
}
