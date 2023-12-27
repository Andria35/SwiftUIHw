//
//  UITableViewRepresentable.swift
//  AccessibleNews
//
//  Created by Andria Inasaridze on 27.12.23.
//

import Foundation
import SwiftUI

struct UITableViewRepresentable: UIViewRepresentable {
    
    // MARK: - Properties
    var data: [Article]
    var fontSize: CGFloat
    
    // MARK: - Methods
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = context.coordinator
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        context.coordinator.data = data
        context.coordinator.fontSize = fontSize
        uiView.reloadData()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(data: data, fontSize: fontSize)
    }
    
    // MARK: - Coordinator
    class Coordinator: NSObject, UITableViewDataSource {
        var data: [Article]
        var fontSize: CGFloat
        
        init(data: [Article], fontSize: CGFloat) {
            self.data = data
            self.fontSize = fontSize
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = data[indexPath.row].title
            cell.textLabel?.font = UIFont.systemFont(ofSize: fontSize)
            
            return cell
        }
    }
}
