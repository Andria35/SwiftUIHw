//
//  MainView.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 17.12.23.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: MainViewModel
    
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
extension MainView {
    
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
                ForEach(viewModel.products) { product in
                    ProductComponentView(viewModel: ProductComponentViewModel(
                        product: product,
                        addProductToBasket: viewModel.addProductToBasket,
                        getQuantityInBasket: viewModel.getQuantityInBasket,
                        reduceItemCount: viewModel.reduceItemCount,
                        productInBasket: viewModel.productInBasket,
                        deleteProductFromBasket: viewModel.deleteProductFromBasket
                    ))
                }
            }
        }
    }
    
}

// MARK: - Preview
#Preview {
    TabView {
        MainView(viewModel: MainViewModel())
            .tabItem {
                Image(systemName: "storefront")
            }
    }
}
