//
//  ContentView.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 08/05/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainViewModel = MainViewViewModel()
    var body: some View {
        if(mainViewModel.isSignedIn && !mainViewModel.currentUserId.isEmpty){
            account
        }else{
            LoginView()
        }
    }
    // This is to create a view
    @ViewBuilder
    var account: some View {
        TabView {
            ToDoListView(userId: mainViewModel.currentUserId).tabItem { Label("Home",systemImage: "house") }
            ProfileView().tabItem {
                Label("Profile",systemImage: "person.crop.circle.fill")
            }
        }
    }
}

#Preview {
    MainView()
}
