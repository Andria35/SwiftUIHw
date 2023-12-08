//
//  LinearGradient.swift
//  ToDoList
//
//  Created by Andria Inasaridze on 08.12.23.
//

import Foundation
import SwiftUI

extension LinearGradient {
    static let mainGradient = LinearGradient(
        stops: [
        Gradient.Stop(color: Color(red: 0.73, green: 0.51, blue: 0.87), location: 0.00),
        Gradient.Stop(color: Color(red: 0.87, green: 0.51, blue: 0.69), location: 1.00),
        ],
        startPoint: UnitPoint(x: 0, y: 0.49),
        endPoint: UnitPoint(x: 1.02, y: 0.73)
        )
}
