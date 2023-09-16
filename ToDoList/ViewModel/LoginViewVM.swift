//
//  LoginViewVM.swift
//  ToDoList
//
//  Created by j.bashimova on 15.09.2023.
//

import Foundation
import FirebaseAuth
class LoginViewVM : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var error = ""
    init(){}
    func login() {
        guard validate()else {
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
