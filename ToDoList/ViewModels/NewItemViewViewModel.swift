//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 16/05/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var alertUser = false
    
    init() {}
    
    var validateNewItem: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        return true
    }
    
    func insertIntoDb(userId: String) {
        let newId = UUID().uuidString
        let newToDo = ToDoItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        let db = Firestore.firestore()
        // we took this approach as we need to differentiate todos of each user id
        db.collection("users").document(userId).collection("todos").document(newId).setData(newToDo.asDictionary())
    }
    
    func save(){
        // Get the userId as we are saving newItem as collection of userId in users db
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // save it in db
        
        insertIntoDb(userId: userId)
    }
}
