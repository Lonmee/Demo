//
//  UserView.swift
//  Demo
//
//  Created by Lonmee on 3/30/21.
//  Copyright © 2021 Lonmee. All rights reserved.
//

import SwiftUI
import CoreData
import SwiftHTTP

struct UserView: View {
    @State var users: [User] = [User]()
    @State var creatorShown = false
    var body: some View {
        List {
            ForEach(users, id: \.self.id) { user in
                NavigationLink(destination: UserDetails(user: user)) {
                    HStack {
                        Text(user.name)
                        Text(String(user.age ?? 0))
                        Text(user.sex! ? "Male" : "Female")
                    }
                }
            }
            .onDelete(perform: deleteUsers)
        }
        .navigationTitle(Text("People"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: { creatorShown.toggle() }) {
            Label("Add Item", systemImage: "plus")
        })
        .onAppear {
            httpGET(api: .USER, id: nil) { data in
                users = data as! [User]
            }
        }
        .sheet(
            isPresented: $creatorShown,
            onDismiss: {
                withAnimation {
                    httpGET(api: .USER, id: nil) { data in
                        users = data as! [User]
                    }
                }
            },
            content: { UserCreator() })
    }
    
    private func deleteUsers(offsets: IndexSet) {
        withAnimation {
            offsets.map { users[$0].id }.forEach({ id in
                httpDelete(api: .USER, id: id) {_ in
                    httpGET(api: .USER, id: nil) { data in
                        users = data as! [User]
                    }
                }
            })
        }
    }
}


struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
