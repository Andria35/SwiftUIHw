//
//  File.swift
//  UserProfileAndChatUI
//
//  Created by Andria Inasaridze on 06.12.23.
//

import Foundation
import SwiftUI

struct User: Hashable {
    let name: String
    let email: String
    let password: String
    let dateOfBirth: String
    let countryRegion: String
    let lastMessage: String
    let lastMessageTime: String
    let profileImage: Image
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
