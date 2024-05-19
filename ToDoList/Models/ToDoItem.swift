//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 18/05/24.
//

import Foundation

struct ToDoItem: Codable, Identifiable {
    let id: String;
    let title: String;
    let dueDate: TimeInterval;
    let createdDate: TimeInterval;
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
