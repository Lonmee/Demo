//
//  UserDetails.swift
//  Demo
//
//  Created by Lonmee on 3/30/21.
//

import SwiftUI

struct UserDetails: View {
    @State var user: User
    var body: some View {
        let contact = user.contact![0]
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
                Text("Nickname: ")
                    .foregroundColor(.gray) +
                    Text(user.name)
                Text("Sex: ")
                    .foregroundColor(.gray) +
                    Text(user.sex! ? "male" : "female")
                Text("Age: ")
                    .foregroundColor(.gray) +
                    Text(String(user.age!))
            }
            Section (header: Text("Contack:")) {
                Text("Email: ")
                    .foregroundColor(.gray) +
                    Text(contact.email!)
                Text("Phone: ")
                    .foregroundColor(.gray) +
                    Text(contact.phone!)
                Text("QQ: ")
                    .foregroundColor(.gray) +
                    Text(contact.qq!)
                Text("Wechat: ")
                    .foregroundColor(.gray) +
                    Text(contact.wechat!)
            }
        }
        .navigationTitle(Text("User info"))
    }
}

//struct UserDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetails(user: <#T##Binding<User>#>)
//    }
//}
