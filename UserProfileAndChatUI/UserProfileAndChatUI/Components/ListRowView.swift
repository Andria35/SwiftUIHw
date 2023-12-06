//
//  ListRowView.swift
//  UserProfileAndChatUI
//
//  Created by Andria Inasaridze on 06.12.23.
//

import SwiftUI

struct ListRowView: View {
    let image: Image
    let name: String
    let lastMessage: String
    let lastMessageTime: String
    
    var body: some View {
        VStack {
            HStack {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                    .clipShape(Circle())
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(name)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                        Text(lastMessage)
                            .font(.subheadline)
                            .lineLimit(1)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    Text(lastMessageTime)
                        .foregroundStyle(.gray)
                }

            }
            Divider()
                .background(Color.white)
        }
    }
}

#Preview {
    ListRowView(image: Image("ProfileImage"), name: "Andria", lastMessage: "Hello, how are you?", lastMessageTime: "Friday")
        .background(Color.mainBackgroundColor)
        .previewLayout(.sizeThatFits)
}
