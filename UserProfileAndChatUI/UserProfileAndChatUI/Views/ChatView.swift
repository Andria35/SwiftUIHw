//
//  ChatView.swift
//  UserProfileAndChatUI
//
//  Created by Andria Inasaridze on 06.12.23.
//

import SwiftUI

struct ChatView: View {
    
    @State var chatIsClear: Bool = false
    @StateObject var viewModel = ChatViewModel()
    
    var body: some View {
        ZStack {
            
            Color.mainBackgroundColor
                .ignoresSafeArea()
            
            VStack {
                
                headerView
                
                // რადგან ეს მესიჯები storage ში არ გვაქვს შენახული რომ თავიდან წამოვიღო,
                // Clear Chat ღილაკზე დაჭერისას მესიჯებს უბრალოდ დავმალავ
                // და შემდეგ გამოვაჩენ მეორე ღილაკზე დაჭრისას.
                // მთლიან array - ს არ წავშლი,
                // რომ შემდეგ აღდგენა შემეძლოს
                
                if chatIsClear {
                    Spacer()
                    Text("Chat is Clear")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    Spacer()
                } else {
                    listView
                }
                
                buttonsView

            }
            .padding(.vertical)
        }
    }
}

#Preview {
    ChatView()
}

extension ChatView {
    
    var headerView: some View {
        Text("Chat")
            .foregroundStyle(.white)
            .font(.title)
        .fontWeight(.semibold)
    }
    
    var listView: some View {
        List(viewModel.users, id: \.self) { user in
            ListRowView(image: user.profileImage, name: user.name, lastMessage: user.lastMessage, lastMessageTime: user.lastMessageTime)
                .listRowBackground(Color.mainBackgroundColor)
        }
        .listStyle(PlainListStyle())
    }
    
    var buttonsView: some View {
        HStack {
            Button(action: {
                withAnimation(.spring) {
                    chatIsClear = true
                }
            }, label: {
                Text("Clear Chat")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.vertical)
                    .padding(.horizontal, 45)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.mainColor)
                    )
        })
            Button(action: {
                withAnimation(.spring) {
                    chatIsClear = false
                }
            }, label: {
                Image(systemName: "gobackward")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
            })
        }
    }
}
