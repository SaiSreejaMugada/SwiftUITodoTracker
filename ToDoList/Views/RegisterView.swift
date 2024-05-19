//
//  RegisterView.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 09/05/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var registerViewModel = RegisterViewViewModel()
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                HeaderView(mainText: "Register", subText: "Start organizing todos",backgroundColor: Color.orange,rotationDegrees: -15)
                
                Form {
                    
                    if(!registerViewModel.errorMessage.isEmpty){
                        Text(registerViewModel.errorMessage).font(.system(size: 10)).foregroundColor(.red)
                    }
                    
                    TextField("Name", text: $registerViewModel.name).textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TextField("Email Address", text: $registerViewModel.emailAddress).textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $registerViewModel.password).textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    ButtonView(title: "Create Account", backgroundColor: .green){
                        registerViewModel.register()
                    }.padding(.vertical,10)
                    
                }
                
            }
            
        }
        
    }
    
}

#Preview {
    RegisterView()
}
