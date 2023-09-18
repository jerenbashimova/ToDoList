//
//  ProfileView.swift
//  ToDoList
//
//  Created by j.bashimova on 15.09.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewVM()
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 125,height: 125)
                        .foregroundColor(.gray)
                        .padding()
                    VStack(alignment: .leading) {
                        HStack() {
                            Text("Name:")
                                .bold()
                            Text(user.name)
                        }
                        .padding()
                        HStack {
                            Text("Email:")
                                .bold()
                            Text(user.email)
                        }
                        .padding()
                        HStack {
                            Text("Member since:")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                        .padding()
                    }
                    .padding()
                    Button {
                        viewModel.logOut()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.pink)
                            Text("Log out")
                                .foregroundColor(.white)
                                .bold()
                        }
                        .frame(width: 300,height: 40)
                    }
                    Spacer()
                } else {
                    Text("Profile is loading ...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
