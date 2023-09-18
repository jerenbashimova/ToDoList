//
//  RegisterViewVM.swift
//  ToDoList
//
//  Created by j.bashimova on 15.09.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewVM: ObservableObject {
    @Published var name: String
    @Published var email: String
    @Published var password: String
    @Published var error: String
   
    init(name: String, email: String, password: String, error: String) {
        self.name = name
        self.email = email
        self.password = password
        self.error = error
    }
    convenience init(){
        self.init(name: "", email: "", password: "", error: "")
    }
   
    func register(){
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    private func validate() -> Bool {
        error = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            error = "Please fil in all fields"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            error = "Please enter valid email"
            return false
        }
        guard password.count >= 6 else {
            error = "Password must contain at least 6 characters"
            return false
        }
        return true
    }
}
