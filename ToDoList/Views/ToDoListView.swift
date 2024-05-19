//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 09/05/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var toDoListViewViewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._toDoListViewViewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items) {
                    item in
                    ToDoListItemView(item: item).swipeActions{
                        Button("Delete") {
                            toDoListViewViewModel.delete(itemId: item.id)
                        }.tint(Color.red)
                    }
                }.listStyle(PlainListStyle())
            }.navigationTitle("To Do List").toolbar {
                Button{
                    toDoListViewViewModel.showNewItemSheet = true
                } label : {
                    Image(systemName: "plus").foregroundColor(.blue).font(.system(size: 20))
                }
            }.sheet(isPresented: $toDoListViewViewModel.showNewItemSheet, content: {
                NewItemView(showNewItemSheet: $toDoListViewViewModel.showNewItemSheet)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "uORW2WufDGXqKzxA0txpotvpNLI2")
}
