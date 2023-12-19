//
//  ProductComponentView.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 17.12.23.
//

import SwiftUI

struct ProductComponentView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: ProductComponentViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            productImageView
            namePriceVStack
            addDeleteHStack
        }
        .padding()
        .background(Color.white.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

// MARK: - Components
extension ProductComponentView {
    
    // MARK: - productImageView
    private var productImageView: some View {
        viewModel.productImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 120)
    }
    
    // MARK: - namePriceVStack
    private var namePriceVStack: some View {
        VStack(alignment:.leading) {
            Text(viewModel.product.title)
                .lineLimit(1)
                .font(.title3)
            .fontWeight(.semibold)
            Text("$: \(viewModel.product.price)")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: - addDeleteHStack
    private var addDeleteHStack: some View {
        HStack {
            Button(action: {
                withAnimation(.interactiveSpring) {
                    viewModel.deleteProduct()
                }
            }, label: {
                Image(systemName: "trash")
            })
            .buttonStyle(.borderless)

            Spacer()
            countHStack
            Spacer()
            
            Image(systemName: viewModel.inBasket() ? "cart.fill" : "cart")
        }
        .padding(.top)
    }
    
    // MARK: - countVStack
    private var countHStack: some View {
        HStack {
            Button(
                action: {
                    viewModel.reduceItem()
                },
                label: {
                    Image(systemName: "minus")
                }
            )
            .buttonStyle(.borderless)
            
            Text("\(viewModel.getQuantity())")
                .font(.title3)
                .padding(.horizontal, 5)
                .overlay {
                    Rectangle()
                        .stroke(Color.black.opacity(0.5))
                }
            
            Button(
                action: {
                    viewModel.addProduct()
                },
                label: {
                    Image(systemName: "plus")
                }
            )
            .buttonStyle(.borderless)
        }
    }
    
}

// MARK: - Preview
#Preview(traits: .sizeThatFitsLayout) {
    ProductComponentView(
        viewModel: ProductComponentViewModel(
            product: ProductMockData.product,
            addProductToBasket: { _ in },
            getQuantityInBasket: { _ in 0 },
            reduceItemCount: { _ in },
            productInBasket: { _ in false },
            deleteProductFromBasket: { _ in }
        )
    )
    .frame(width: 200)
}
