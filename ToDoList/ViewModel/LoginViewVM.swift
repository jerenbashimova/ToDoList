//
//  LoginViewVM.swift
//  ToDoList
//
//  Created by j.bashimova on 15.09.2023.
//

import Foundation
import FirebaseAuth

class LoginViewVM: ObservableObject {
    @Published var email: String
    @Published var password: String
    @Published var error: String
    init(email: String, password: String, error: String) {
        self.email = email
        self.password = password
        self.error = error
    }
    convenience init() {
        self.init(email: "", password: "", error: "")
    }
   
    func login() {
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        error  = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            error = "Please fill in all fields"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            error = "Please enter valid email"
            return false
        }
        return true
    }
}
