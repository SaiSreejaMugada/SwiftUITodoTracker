//
//  BodyView.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 10/05/24.
//

import SwiftUI

struct BodyView: View {
    @StateObject var loginViewModel = LoginViewViewModel()
    var body: some View {
        
        Form {
            
            if !loginViewModel.errorMessage.isEmpty {
                Text(loginViewModel.errorMessage).font(.system(size: 10)).foregroundColor(.red)
            }
            
            TextField("Email Address", text: $loginViewModel.emailAddress).textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
            
            SecureField("Password", text: $loginViewModel.password).textFieldStyle(RoundedBorderTextFieldStyle())
            
            ButtonView(title: "Login", backgroundColor: .blue) {
                loginViewModel.login()
            }.padding(.vertical,10)
            
        }.scrollDisabled(true).offset(y: -50)
    }
}

#Preview {
    BodyView()
}
