//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 16/05/24.
//
import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject {
    @Published var showNewItemSheet = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    func delete(itemId: String){
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("todos").document(itemId).delete()
    }
    
}
