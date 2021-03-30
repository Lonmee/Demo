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
    @Environment(\.managedObjectContext) private var viewContext
    
    //    @FetchRequest(
    //        sortDescriptors: [NSSortDescriptor(keyPath: \CDUser.nick, ascending: true)],
    //        animation: .default)
    //    private var cdUsers: FetchedResults<CDUser>
    
    @State
    var users: [User] = [User]()
    var body: some View {
        List {
            ForEach(users, id: \.self.id.uuidString) { user in
                HStack {
                    Text(user.name)
                    Text(String(user.age!))
                    Text(user.sex! ? "Male" : "Female")
                }
            }
        }
        .navigationTitle(Text("People"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: addUser) {
            Label("Add Item", systemImage: "plus")
        })
        .onAppear {
            print(UIDevice.current.identifierForVendor!.uuidString)
            httpGET(api: .USER, id: nil) { data in
                users = data as! [User]
            }
        }
    }
    
    private func addUser() {
        withAnimation {
            //            let newUser = CDUser(context: viewContext)
            //            newUser.nick = "new one"
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            //            offsets.map { cdUsers[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}


struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
