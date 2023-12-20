//
//  DailyNewsViewModel.swift
//  DailyJournal
//
//  Created by Andria Inasaridze on 20.12.23.
//

import Foundation

final class DailyNewsViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var titleTextField = ""
    @Published var newsTextField = ""
    @Published var newsDatePicker = Date()
    @Published var newsList: [News] = []
    @Published var favourites: [News] = []
    @Published var filterDatePicker = Date()
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }
    
    private var originalNewsList: [News] = []

    // MARK: - Methods
    func saveNews() {
        if !titleTextField.isEmpty && !newsTextField.isEmpty {
            let news = News(title: titleTextField, news: newsTextField, date: dateFormatter.string(from: newsDatePicker))
            originalNewsList.append(news)
            updateNewsList()
        }
    }
    
    func delete(indexSet: IndexSet) {
        originalNewsList.remove(atOffsets: indexSet)
        updateNewsList()

    }
    
    func move(indices: IndexSet, newOffset: Int) {
        originalNewsList.move(fromOffsets: indices, toOffset: newOffset)
        updateNewsList()

    }
    
    func addToFavourites(news: News) {
        guard let index = newsList.firstIndex(where:{ $0.id == news.id}) else { return }
        originalNewsList[index].isFavourite = true
        favourites.append(originalNewsList[index])
        updateNewsList()

    }
    
    func filterNewsList() {
        newsList = originalNewsList.filter { $0.date == dateFormatter.string(from: filterDatePicker) }
    }
    
    private func updateNewsList() {
        newsList = originalNewsList
    }
}
