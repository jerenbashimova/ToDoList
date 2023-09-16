//
//  NewItemView.swift
//  ToDoList
//
//  Created by j.bashimova on 15.09.2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewVM()
    @Binding var newItemPresented : Bool
    var body: some View {
        VStack {
            Text("New Item")
                .bold()
                .font(.system(size: 32))
                .padding(.top,20)
            Form {
                TextField("title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                LRButton(title: "Save",
                         background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    }
                    else {
                        viewModel.showAlert = true
                    }
                }
                         .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and due dates that is today or newer"))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
        }))
    }
}
