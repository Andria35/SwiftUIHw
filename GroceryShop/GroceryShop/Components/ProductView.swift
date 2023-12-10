//
//  ProductView.swift
//  GroceryShop
//
//  Created by Andria Inasaridze on 10.12.23.
//

import SwiftUI

struct ProductView: View {
    
    //MARK: - Struct Properties
    @EnvironmentObject private var viewModel: GroceryShopViewModel
    let product: Product

    // MARK: - Main Body
    var body: some View {
        HStack {
            productImageView
            nameAndPriceVStack
            Spacer()
            inStockVStack
        }
        .padding()
        .background(Color.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

// MARK: - ProductView Components
extension ProductView {
    
    var productImageView: some View {
        product.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 80)
    }
    
    var nameAndPriceVStack: some View {
        VStack(alignment: .leading) {
            Text(product.name)
                .font(.title)
                .fontWeight(.bold)
            
            VStack {
                Text("Price:")
                Text( "\(product.price)$")
            }
            .font(.title2)
            .fontWeight(.semibold)
        }
    }
    
    var inStockVStack: some View {
        VStack(spacing: 5) {
            Text("In Stock: \(product.availableQuantityInStock)")
                .font(.title3)
                .fontWeight(.semibold)
            
            plusAndMinusButtonHStack
            
            deleteButton
        }

    }
    
    var plusAndMinusButtonHStack: some View {
        HStack(spacing: 15) {
            Button(action: {
                viewModel.reduceItemCount(for: product)
            }, label: {
                Image(systemName: "minus")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
            })
            .buttonStyle(.borderless)
            
            Button(action: {
                viewModel.addProductToBasket(product)
            }, label: {
                Image(systemName: "plus")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
            })
            .buttonStyle(.borderless)
        }
    }
    
    var deleteButton: some View {
        Button(action: {
            viewModel.deleteProductFromBasket(product)
        }, label: {
            Text("Delete")
                .foregroundStyle(.white)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color.red.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 10))                })
        .buttonStyle(.borderless)
    }
}

#Preview {
    ProductView(product: Product(name: "Apple", image: Image("Apple"), price: "5.0", availableQuantityInStock: 10))
        .environmentObject(GroceryShopViewModel())
        .previewLayout(.sizeThatFits)
}
