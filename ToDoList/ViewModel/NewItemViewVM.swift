//
//  NewItemViewVM.swift
//  ToDoList
//
//  Created by j.bashimova on 15.09.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewVM: ObservableObject {
    @Published var title: String
    @Published var dueDate = Date()
    @Published var showAlert: Bool
    init(title: String, dueDate: Date, showAlert: Bool) {
        self.title = title
        self.dueDate = dueDate
        self.showAlert = showAlert
    }
    convenience init(){
        self.init(title: "", dueDate: Date(), showAlert: false)
    }
    func save(){
        guard canSave else{
            return
        }
        //  get current users id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        //  create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        //  save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
