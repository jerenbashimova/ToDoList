//
//  RegisterView.swift
//  ToDoList
//
//  Created by j.bashimova on 15.09.2023.
//

import SwiftUI

struct RegisterView: View {
   @StateObject var registerViewModel = RegisterViewVM()
    var body: some View {
        VStack {
            HeaderView(title: "Register",
                       subtitle: "Start organizing todos",
                       angle: -20,
                       background: .green)
            Form {
                if !registerViewModel.error.isEmpty {
                    Text(registerViewModel.error)
                        .foregroundColor(.red)
                }
                TextField("Full Name", text: $registerViewModel.name)
                    .autocorrectionDisabled()
                TextField("Email", text: $registerViewModel.email)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $registerViewModel.password)
                LRButton(title: "Create Account",
                         background: .green) {
                    registerViewModel.register()
                }
            }
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
