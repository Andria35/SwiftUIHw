//
//  DailyNewsView.swift
//  DailyJournal
//
//  Created by Andria Inasaridze on 20.12.23.
//

import SwiftUI

struct DailyNewsView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: DailyNewsViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            formView
            Text(viewModel.newsList.isEmpty ? "List is empty" : "List is not empty")
                .font(.title)
                .fontWeight(.semibold)
            filterHStack
            listView
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
        }
    }
}

// MARK: - Components
extension DailyNewsView {
    
    // MARK: - FormView
    private var formView: some View {
        Form {
            TextField("Title", text: $viewModel.titleTextField)
            TextEditor(text: $viewModel.newsTextField)
            DatePicker("Date:", selection: $viewModel.newsDatePicker, displayedComponents: .date)
            Button("Save News", action: {
                viewModel.saveNews()
            })
        }

    }
    
    // MARK: - FilterHStack
    private var filterHStack: some View {
        HStack {
            DatePicker("Date:", selection: $viewModel.filterDatePicker, displayedComponents: .date)

            Button(action: {
                viewModel.filterNewsList()
            }, label: {
                Text("Filter")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            })
        }
        .padding(.horizontal)
    }
    
    // MARK: - ListView
    private var listView: some View {
        List {
            ForEach(viewModel.newsList) { news in
                NewsComponentView(news: news)
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button("Favourite") {
                            viewModel.addToFavourites(news: news)
                        }
                        .tint(.yellow)
                    }
            }
            .onDelete(perform: viewModel.delete)
            .onMove(perform: viewModel.move)
        }

    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        DailyNewsView()
    }
    .environmentObject(DailyNewsViewModel())
}
