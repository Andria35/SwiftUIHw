//
//  ProductsView.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 18.12.23.
//

import SwiftUI

struct ProductsView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: ProductsViewModel
    @EnvironmentObject private var router: Router

    private let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    // MARK: - Body
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            isLoading()
        }
        .toolbar {
            ToolbarItem(placement: .principal, content: {
                HeaderTextComponentView(text: "Products")
            })
        }
    }
    
    // MARK: - Methods
    private func isLoading() -> some View {
        Group {
            if viewModel.isLoading {
                LoadingComponentView(isLoading: $viewModel.isLoading)
            } else {
                VStack {
                    cartComponentView
                    productScrollView
                }
                .padding()
            }
        }
    }
}

// MARK: - Components
extension ProductsView {
    
    // MARK: CartComponentView
    private var cartComponentView: some View {
        CartComponentView(
            viewModel: CartComponentViewModel(
                checkout: viewModel.checkout,
                basketItemCountIsEmpty: viewModel.basketItemCountIsEmpty
            ),
            isLoading: $viewModel.isLoading,
            showSuccessAlert: $viewModel.showSuccessAlert,
            showFailureAlert: $viewModel.showFailureAlert,
            userBalance: viewModel.userBalance,
            basketItemCount: viewModel.basketItemCount,
            basketTotalPrice: viewModel.basketTotalPrice
        )
    }
    
    // MARK: ProductScrollView
    private var productScrollView: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout) {
                ForEach(viewModel.categoryProduct) { product in
                    ProductComponentView(viewModel: ProductComponentViewModel(
                        product: product,
                        addProductToBasket: viewModel.addProductToBasket,
                        getQuantityInBasket: viewModel.getQuantityInBasket,
                        reduceItemCount: viewModel.reduceItemCount,
                        productInBasket: viewModel.productInBasket,
                        deleteProductFromBasket: viewModel.deleteProductFromBasket
                    ))
                    .onTapGesture {
                        router.navigate(to: .productsDetailsView(product: product))
                    }
                }
            }
        }
    }
}

// MARK: - Properties
#Preview {
    NavigationStack {
        ProductsView(
            viewModel: ProductsViewModel(
                products: [],
                category: ""
            )
        )
        .environmentObject(Router())
    }
}
