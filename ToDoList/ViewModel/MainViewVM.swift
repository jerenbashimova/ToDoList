//
//  MainViewVM.swift
//  ToDoList
//
//  Created by j.bashimova on 15.09.2023.
//

import Foundation
import FirebaseAuth

class MainViewVM: ObservableObject {
    @Published var currentUserId: String
    private var  handler: AuthStateDidChangeListenerHandle?
    init(currentUserId: String) {
        self.currentUserId = currentUserId
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _ , user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    convenience init(){
        self.init(currentUserId: "")
    }
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
