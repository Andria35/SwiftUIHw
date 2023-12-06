//
//  SwiftUIView.swift
//  UserProfileAndChatUI
//
//  Created by Andria Inasaridze on 06.12.23.
//

import SwiftUI

struct TextFieldView: View {
    
    let textFieldType: String
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(textFieldType)
                .fontWeight(.semibold)
            TextField("Input \(textFieldType)", text: $textFieldText)
                .textFieldStyle(.roundedBorder)
                .font(.headline)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray)
                )
        }
    }
}

#Preview {
    TextFieldView(textFieldType: "Name")
        .previewLayout(.sizeThatFits)
}
