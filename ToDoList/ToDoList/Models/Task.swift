//
//  Task.swift
//  ToDoList
//
//  Created by Andria Inasaridze on 08.12.23.
//

import Foundation
import SwiftUI


struct Task: Hashable {
    let id = UUID()
    let toDo: String
    let color: Color
    let date: String
    let isFinished: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
