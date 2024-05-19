//
//  LoginView.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 09/05/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView{
            // since all the items are vertical have a vertical stack
            VStack{
                //header
                // since we want a pink background and to the top of it we need add two strings , we need a ZStack for stacking (everything inside it will have 1 z value above it
                HeaderView(mainText: "To Do List", subText: "Get things done",backgroundColor: Color.pink)
                BodyView()
                LoginFooterView()
                
            }
        }
    }
}

#Preview {
    LoginView()
}
