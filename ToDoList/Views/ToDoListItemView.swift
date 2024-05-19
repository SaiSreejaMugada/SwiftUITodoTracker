//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 09/05/24.
//

import SwiftUI

struct RadioButtonToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Rectangle().frame(width: 15, height: 15).cornerRadius(7.5).foregroundColor(.blue).overlay(
            Image(systemName: configuration.isOn ? "checkmark" : "").resizable().frame(width: 7, height: 7).foregroundColor(.white)).onTapGesture {
                withAnimation(.spring()) {
                    configuration.isOn.toggle()
                }
            }
    }
}

struct ToDoListItemView: View {
    @StateObject var toDoListItemViewViewModel = ToDoListItemViewViewModel()
    var item: ToDoItem
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text(item.title).font(.system(size: 20)).foregroundColor(.black)
                    Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))").font(.system(size: 14)).foregroundColor(.gray)
                }
                Spacer()
                Button {
                    toDoListItemViewViewModel.makeItemDone(item: item)
                } label: {
                    Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: ToDoItem(id: "123", title: "Get Ready", dueDate: Date().timeIntervalSince1970
, createdDate: Date().timeIntervalSince1970, isDone: false))
}
