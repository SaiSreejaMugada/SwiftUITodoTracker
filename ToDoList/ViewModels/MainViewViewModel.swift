//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 12/05/24.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener {
            //This is to do async and will not block the main thread
            [weak self] _, user in DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
