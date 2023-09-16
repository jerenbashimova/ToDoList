//
//  LRButton.swift
//  ToDoList
//
//  Created by j.bashimova on 15.09.2023.
//

import SwiftUI

struct LRButton: View {
    let title:String
    let background:Color
    let action:() -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct LRButton_Previews: PreviewProvider {
    static var previews: some View {
        LRButton(title: "value",
                 background: .pink) {
            
        }
    }
}
