//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 11/05/24.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var emailAddress = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    private func validate() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please Enter a Valid Name"
            return false
        }
        
        guard !emailAddress.trimmingCharacters(in: .whitespaces).isEmpty && emailAddress.contains("@") && emailAddress.contains(".") else{
            errorMessage = "Please Enter a Valid Email Address"
            return false
        }
        
        guard !password.trimmingCharacters(in: .whitespaces).isEmpty && password.count > 5 else{
            errorMessage = "Please Enter a Valid Password"
            return false
        }
        
        errorMessage = ""
        return true
    }
    
    private func insertUserRecord(id: String) -> Void{
        let newUser = User(id: id, name: name, email: emailAddress, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary())
    }
    
    func register() {
        guard self.validate() else {
            return
        }
        // register
        Auth.auth().createUser(withEmail: emailAddress, password: password){ [weak self] result,
            error in guard let userId = result?.user.uid else{
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
}
