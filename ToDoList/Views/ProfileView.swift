//
//  ProfileView.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 09/05/24.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ProfileView: View {
    @StateObject var profileViewViewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if let user = profileViewViewModel.user {
                    Image(systemName: "person.crop.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(.blue).frame(width: 100,height: 100)
                    VStack(alignment: .leading){
                        HStack{
                            Text("Name: ").bold()
                            Text(user.name)
                        }.padding()
                        HStack{
                            Text("Email: ").bold()
                            Text(user.email)
                        }.padding()
                        HStack{
                            Text("Member Since: ").bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted())")
                        }.padding()
                    }.padding()
                    Button{
                        profileViewViewModel.signOut()
                    } label: {
                        Text("Sign Out").foregroundStyle(.pink).padding()
                    }
                }else{
                    Text("Profile Loading...")
                }
            }.navigationTitle("Profile")
        }.onAppear{
            profileViewViewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
