//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by j.bashimova on 15.09.2023.
//

import SwiftUI
import FirebaseCore
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
