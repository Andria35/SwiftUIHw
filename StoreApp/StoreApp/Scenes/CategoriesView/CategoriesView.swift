//
//  CategoriesView.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 17.12.23.
//

import SwiftUI

struct CategoriesView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = CategoriesViewModel()
    @EnvironmentObject private var router: Router

    // MARK: - Body
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            categoriesScrollView
        }
        .toolbar {
            ToolbarItem(placement: .principal, content: {
                headerTextComponentView(text: "Categories")
            })
        }
    }
}

// MARK: - Components
extension CategoriesView {
    
    // MARK: - categoriesScrollView
    private var categoriesScrollView: some View {
        ScrollView {
            ForEach(viewModel.uniqueCategories, id: \.self) { category in
                Button(action: {
                    router.navigate(to: .productsView(category: category, products: viewModel.products))
                }, label: {
                    CategoryComponentView(category: category)
                })
            }
        }
    }
    
}

// MARK: - Preview
#Preview {
    TabView {
        NavigationStack {
            CategoriesView()
                .tabItem {
                    Image(systemName: "menucard.fill")
                }
        }
    }
}
