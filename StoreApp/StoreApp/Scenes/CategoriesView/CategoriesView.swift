//
//  CategoriesView.swift
//  StoreApp
//
//  Created by Andria Inasaridze on 17.12.23.
//

import SwiftUI

struct CategoriesView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: CategoriesViewModel
    @EnvironmentObject private var router: Router
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            categoriesScrollView
        }
        .toolbar {
            ToolbarItem(placement: .principal, content: {
                HeaderTextComponentView(text: "Categories")
            })
        }
    }
}

// MARK: - Components
extension CategoriesView {
    
    // MARK: CategoriesScrollView
    private var categoriesScrollView: some View {
        ScrollView {
            ForEach(viewModel.uniqueCategories, id: \.self) { category in
                Button(
                    action: {
                        router.navigate(to: .productsView(
                            category: category,
                            products: viewModel.products
                        ))
                    },
                    label: {
                        CategoryComponentView(category: category)
                    }
                )
            }
        }
    }
    
}

// MARK: - Preview
#Preview {
    TabView {
        NavigationStack {
            CategoriesView(viewModel: CategoriesViewModel())
                .tabItem {
                    Image(systemName: "menucard.fill")
                }
        }
    }
}
