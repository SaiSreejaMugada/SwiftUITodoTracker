//
//  ButtonView.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 11/05/24.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10).foregroundColor(backgroundColor)
                Text(title).foregroundColor(.white).bold()
            }
        }
    }
}

#Preview {
    ButtonView(title: "Do Something", backgroundColor: .pink) {
    }
}
