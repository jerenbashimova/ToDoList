//
//  LoginView.swift
//  ToDoList
//
//  Created by j.bashimova on 15.09.2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List",
                           subtitle: "Get Things Done",
                           angle: 20,
                           background: .blue)
                FormView()
                VStack{
                    Text("Are you new here ?")
                    NavigationLink("Create An account", destination: RegisterView())
                        .foregroundColor(.blue)
                }
                .padding(.bottom,50)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct FormView: View{
    @StateObject var viewModel = LoginViewVM()
    var body: some View {
        Form {
            if !viewModel.error.isEmpty {
                Text(viewModel.error)
                    .foregroundColor(.red)
            }
            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            LRButton(title: "Log In",
                     background: .blue) {
                viewModel.login()
            }
        }
        .cornerRadius(10)
        .padding()
        .offset(y:-50)
    }
}
