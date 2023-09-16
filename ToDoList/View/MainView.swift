//
//  ContentView.swift
//  ToDoList
//
//  Created by j.bashimova on 15.09.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainViewModel = MainViewVM()
    var body: some View {
        if mainViewModel.isSignedIn , !mainViewModel.currentUserId.isEmpty {
            TabView{
                ToDoListView(userId: mainViewModel.currentUserId)
                    .tabItem {
                        Label("home", systemImage: "house")
                    }
                ProfileView()
                    .tabItem {
                        Label("profile", systemImage: "person.circle")
                    }
            }
        }
        else{
            LoginView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
