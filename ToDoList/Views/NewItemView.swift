//
//  NewItemView.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 09/05/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var newItemViewViewModel = NewItemViewViewModel()
    @Binding var showNewItemSheet: Bool
    var body: some View {
        VStack{
            Text("New Item").bold().font(.system(size: 30)).padding()
            Form{
                TextField("Title", text: $newItemViewViewModel.title).textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                DatePicker("Due Date", selection: $newItemViewViewModel.dueDate,
                           in: Date()...
                           ,displayedComponents: [.date]).datePickerStyle(.graphical)
                ButtonView(title: "Create", backgroundColor: .pink){
                    if(newItemViewViewModel.validateNewItem){
                        newItemViewViewModel.save()
                        showNewItemSheet = false
                    }else{
                        newItemViewViewModel.alertUser = true
                    }
                }.frame(width: 300, height: 40).padding(.vertical,20)
            }.alert(isPresented: $newItemViewViewModel.alertUser){
                Alert(title: Text("Error"), message:
                    Text("Please input a valid title")
                )
            }
        }
    }
}

#Preview {
    NewItemView(showNewItemSheet: Binding.constant(false))
}
