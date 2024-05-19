//
//  LoginFooterView.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 10/05/24.
//

import SwiftUI

struct LoginFooterView: View {
    var body: some View {
        VStack{
            Text("New around here?").padding(.vertical, 5)
            NavigationLink("Create An Account", destination: RegisterView())
        }.padding(.bottom, 50).offset(y: -50)
    }
}

#Preview {
    LoginFooterView()
}
