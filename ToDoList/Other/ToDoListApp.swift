//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 08/05/24.
// This is entry point for our app

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
