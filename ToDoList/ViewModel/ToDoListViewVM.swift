//
//  ToDoListViewVM.swift
//  ToDoList
//
//  Created by j.bashimova on 15.09.2023.
//

import Foundation
import FirebaseFirestore

class ToDoListViewVM:ObservableObject {
    @Published var showingNewItemView: Bool
    private let userId: String
    init(showingNewItemView: Bool,userId:String) {
        self.showingNewItemView = showingNewItemView
        self.userId = userId
    }
    convenience init(userId:String){
        self.init(showingNewItemView: false, userId: userId)
    }
    
    func delete (id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
