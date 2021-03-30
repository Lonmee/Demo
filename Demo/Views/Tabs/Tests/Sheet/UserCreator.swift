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
                let newItem = Item(context: viewContext)
                newItem.timestamp = Date()
                self.mode.wrappedValue.dismiss()
            })
        }
    }
}

struct UserCreator_Previews: PreviewProvider {
    static var previews: some View {
        UserCreator()
    }
}
