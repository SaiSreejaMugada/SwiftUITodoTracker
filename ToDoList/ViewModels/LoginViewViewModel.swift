//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 11/05/24.
//  All the business logic we are gonna put in the ViewModal

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var emailAddress = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login(){
        guard validate() else{
            return
        }
        // Using firebase fns to authenticate
        Auth.auth().signIn(withEmail: emailAddress, password: password)
    }
    
    func validate() -> Bool {
        guard !emailAddress.trimmingCharacters(in: .whitespaces).isEmpty && emailAddress.contains("@") && emailAddress.contains(".") else{
            errorMessage = "Please enter the Email Address"
            return false
        }
        guard !password.trimmingCharacters(in: .whitespaces).isEmpty && password.count > 5 else{
            errorMessage = "Please enter the Password"
            return false
        }
        errorMessage = ""
        print("Called")
        return true
    }
}
