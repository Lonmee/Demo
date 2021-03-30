//
//  UserCreator.swift
//  Demo
//
//  Created by Lonmee on 10/26/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI
import CoreData

struct UserCreator: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var mode
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State var nick: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var qq: String = ""
    @State var wechat: String = ""
    
    var body: some View {
        VStack {
            Text("Profile Creator")
                .foregroundColor(.blue)
                .font(.title)
                .padding(.top, 20)
            Form {
                Section (header: Text("Head Icon:")) {
                    HStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 80) {
                        Image(systemName: "person.fill")
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Button("Take photo", action: {
                            
                        })
                        .background(Color.gray)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    }
                }
                Section (header: Text("Nick:")) {
                    TextField("Enter your nick", text: $nick)
                }
                Section (header: Text("Contack:")) {
                    TextField("Email", text: $email)
                    TextField("Phone", text: $phone)
                    TextField("QQ", text: $qq)
                    TextField("Wechat", text: $wechat)
                }
            }
            Button("Create", action: {
                addItem()
                self.mode.wrappedValue.dismiss()
            })
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            
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
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
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

struct UserCreator_Previews: PreviewProvider {
    static var previews: some View {
        UserCreator()
    }
}
