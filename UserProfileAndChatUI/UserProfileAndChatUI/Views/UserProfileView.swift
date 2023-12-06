//
//  UserProfileView.swift
//  UserProfileAndChatUI
//
//  Created by Andria Inasaridze on 06.12.23.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        VStack {
            
            headerHStack
            
            Spacer()
            
            profileImage
            
            Spacer()
            
            textFieldsVStack
            
            Spacer()
            
            saveChangesButton
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    UserProfileView()
}

extension UserProfileView {
    
    var headerHStack: some View {
        HStack {
            Image(systemName: "chevron.left")
                .font(.title2)
            Spacer()
            Text("Edit Profile")
            Spacer()
        }
        .fontWeight(.semibold)
    }
    
    var profileImage: some View {
        Image("ProfileImage")
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(Color.gray, lineWidth: 2)
                Image(systemName: "camera.fill")
                    .padding(.horizontal)
                    .font(.title)
                    .foregroundStyle(Color.mainColor)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
    }

    var textFieldsVStack: some View {
        VStack() {
            TextFieldView(textFieldType: "Name")
            TextFieldView(textFieldType: "Email")
            TextFieldView(textFieldType: "Password")
            TextFieldView(textFieldType: "Date of Birth")
            TextFieldView(textFieldType: "Country/Region")
        }
    }
    
    var saveChangesButton: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Save Changes")
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
    }
    
}
