//
//  MainView.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 17.12.23.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = MainViewModel()
    @State private var isLoading: Bool = false
    
    private let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            if isLoading {
                LoadingComponentView(isLoading: $isLoading)
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
    
    // MARK: - cartComponentView
    private var cartComponentView: some View {
        CartComponentView(viewModel: CartComponentViewModel(checkout: viewModel.checkout, basketItemCountIsEmpty: viewModel.basketItemCountIsEmpty), userBalance: viewModel.userBalance, basketItemCount: viewModel.basketItemCount, basketTotalPrice: viewModel.basketTotalPrice, isLoading: $isLoading, showSuccessAlert: $viewModel.showSuccessAlert, showFailureAlert: $viewModel.showFailureAlert)
    }
    
    // MARK: - productScrollView
    private var productScrollView: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout) {
                ForEach(viewModel.products) { product in
                    ProductComponentView( viewModel: ProductComponentViewModel(product: product,addProductToBasket: viewModel.addProductToBasket, getQuantityInBasket: viewModel.getQuantityInBasket, reduceItemCount: viewModel.reduceItemCount, productInBasket: viewModel.productInBasket, deleteProductFromBasket: viewModel.deleteProductFromBasket))
                }
            }
        }
    }
    
}

// MARK: - Preview
#Preview {
    TabView {
        MainView()
            .tabItem {
                Image(systemName: "storefront")
            }
    }
}
