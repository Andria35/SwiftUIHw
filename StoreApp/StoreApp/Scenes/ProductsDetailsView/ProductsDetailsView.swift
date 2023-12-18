//
//  ProductsDetailsView.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 18.12.23.
//

import SwiftUI

struct ProductsDetailsView: View {
    
    @StateObject var viewModel: ProductDetailsViewModel
    @EnvironmentObject private var router: Router
    
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            VStack{
                productImage
                descriptionVStack
                Spacer()
                returnToCategoriesButton
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .toolbar {
            ToolbarItem(placement: .principal, content: {
                headerTextComponentView(text: "Product Details")
            })
        }
    }
}

// MARK: - Components
extension ProductsDetailsView {
    
    // MARK: - productImage
    private var productImage: some View {
        viewModel.productImage
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
            .padding(.horizontal)
            .shadow(color: Color.shadowColor, radius: 15)
            .padding(.bottom)
    }
    
    // MARK: - descriptionVStack
    private var descriptionVStack: some View {
        VStack(alignment:.leading) {
            HStack {
                Text("Name: \(viewModel.product.title)")
                    .font(.title)
                Spacer()
                Text("$:\(viewModel.product.price)")
                    .font(.title3)
                    .opacity(0.7)
            }
            .fontWeight(.semibold)
            
            HStack {
                Text("Brand: \(viewModel.product.brand)")
                    .font(.title2)
                    .opacity(0.5)
                    .fontWeight(.medium)
                Spacer()
                Text("⭐️: \(String(format: "%.1f", viewModel.product.rating))")
                    .font(.title3)

            }

            Text("Description: \(viewModel.product.description)")
                .font(.title2)
                .lineLimit(3)
                .fontWeight(.medium)
        }
    }
    
    // MARK: - returnToCategoriesButton
    private var returnToCategoriesButton: some View {
        Button(action: {
            router.navigateToRoot()
        }, label: {
            Text("Return To Categories")
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.secondaryBackgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
}

#Preview {
    NavigationStack {
        ProductsDetailsView(viewModel: ProductDetailsViewModel(product: ProductMockData.product))
    }
    .environmentObject(Router())
}
