//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 19/05/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject {
    
    init() {}
    
    func makeItemDone(item: ToDoItem){
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        var newItem = item
        newItem.setDone(!item.isDone)
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("todos").document(newItem.id).setData(newItem.asDictionary())
    }
    
}
