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
    
    @Environment(\.presentationMode) var mode
    @State var nick: String = ""
    @State var sex: String = "male"
    @State var age: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var qq: String = ""
    @State var wechat: String = ""
    
    let pickerList = ["male", "female"]
    
    var body: some View {
        VStack {
            Text("Profile Creator")
                .foregroundColor(.blue)
                .font(.title3)
                .padding(.top, 20)
            Form {
                Section (header: Text("Head Icon:")) {
                    HStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 80) {
                        Image(systemName: "person.fill")
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Button("Take photo", action: {
                            
                        })
                        .background(Color.gray)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    }
                }
                Section (header: Text("Infomation:")) {
                    TextField("Nick name", text: $nick)
                    HStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
                        Text("Sex")
                        Picker(selection: $sex, label: Text("Sex")) {
                            ForEach(pickerList, id: \.self) { value in
                                Text(String(value)).tag(value)
                            }
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                }
                Section (header: Text("Contack:")) {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                    TextField("Phone", text: $phone)
                        .keyboardType(.phonePad)
                    TextField("QQ", text: $qq)
                        .keyboardType(.numberPad)
                    TextField("Wechat", text: $wechat)
                }
            }
            Button(!nick.isEmpty && !age.isEmpty && !sex.isEmpty ? "Create" : "Cancel", action: {
                if !nick.isEmpty && !age.isEmpty && !sex.isEmpty {
                    addUser()
                } else {
                    self.mode.wrappedValue.dismiss()
                }
            })
        }
    }
    
    private func addUser() {
        withAnimation {
            let uuid = UUID().uuidString
            let user = User(id: uuid, name: nick, sex: sex == "male", age: Int(age), contact: [Contact(uid: uuid, phone: phone, email: email, qq: qq, wechat: wechat)])
            httpPOST(api: .USER, param: [user]) { data in
                print(data)
                self.mode.wrappedValue.dismiss()
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            
        }
    }
}

struct UserCreator_Previews: PreviewProvider {
    static var previews: some View {
        UserCreator()
    }
}
