//
//  ChatViewModel.swift
//  UserProfileAndChatUI
//
//  Created by Andria Inasaridze on 06.12.23.
//

import Foundation
import SwiftUI

final class ChatViewModel: ObservableObject {
    @Published var users: [User] = [
        User(name: "testUser1", email: "asdasd", password: "adasd", dateOfBirth: "10/07/2001", countryRegion: "Georgia", lastMessage: "Hello world, How are you?", lastMessageTime: "Friday", profileImage: Image("ProfileImage")),
        User(name: "testUser2", email: "asdasd", password: "adasd", dateOfBirth: "10/07/2001", countryRegion: "Georgia", lastMessage: "Hello world", lastMessageTime: "Friday", profileImage: Image("ProfileImage")),
        User(name: "testUser3", email: "asdasd", password: "adasd", dateOfBirth: "10/07/2001", countryRegion: "Georgia", lastMessage: "Hello world", lastMessageTime: "Friday", profileImage: Image("ProfileImage")),
        User(name: "testUser4", email: "asdasd", password: "adasd", dateOfBirth: "10/07/2001", countryRegion: "Georgia", lastMessage: "Hello world", lastMessageTime: "Friday", profileImage: Image("ProfileImage")),
        User(name: "testUser5", email: "asdasd", password: "adasd", dateOfBirth: "10/07/2001", countryRegion: "Georgia", lastMessage: "Hello world", lastMessageTime: "Friday", profileImage: Image("ProfileImage")),
        User(name: "testUser6", email: "asdasd", password: "adasd", dateOfBirth: "10/07/2001", countryRegion: "Georgia", lastMessage: "Hello world", lastMessageTime: "Friday", profileImage: Image("ProfileImage")),
        User(name: "testUser7", email: "asdasd", password: "adasd", dateOfBirth: "10/07/2001", countryRegion: "Georgia", lastMessage: "Hello world", lastMessageTime: "Friday", profileImage: Image("ProfileImage")),
        User(name: "testUser8", email: "asdasd", password: "adasd", dateOfBirth: "10/07/2001", countryRegion: "Georgia", lastMessage: "Hello world", lastMessageTime: "Friday", profileImage: Image("ProfileImage")),
        User(name: "testUser9", email: "asdasd", password: "adasd", dateOfBirth: "10/07/2001", countryRegion: "Georgia", lastMessage: "Hello world", lastMessageTime: "Friday", profileImage: Image("ProfileImage")),
        User(name: "testUser10", email: "asdasd", password: "adasd", dateOfBirth: "10/07/2001", countryRegion: "Georgia", lastMessage: "Hello world", lastMessageTime: "Friday", profileImage: Image("ProfileImage"))
    ]
}
