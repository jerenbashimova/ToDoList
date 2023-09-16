//
//  ToDoListView.swift
//  ToDoList
//
//  Created by j.bashimova on 15.09.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewVM
    @FirestoreQuery var items : [ToDoListItem]
    init(userId:String) {
        self._items = FirestoreQuery (
            collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewVM(userId: userId))
    }
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item:item)
                        .swipeActions{
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            } .tint(.red)
                        }
                }
                .listStyle(DefaultListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "LJvhVVKTWKXmLpiMGp4R1yg5rgD3")
    }
}
