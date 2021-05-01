//
//  Second.swift
//  Demo
//
//  Created by Lonmee on 8/29/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        Image("10dwio4")
            .resizable()
            .scaledToFill()
            .frame(height: 200)
            .clipped()
        ScrollView(){
            Spacer(minLength: 20)
            CapsuleText(text: "Frist")
                .onTapGesture(count: 1, perform: {
                    accountReq(name: "Lonmee") { data in
                        let users = data as! [User]
                        print(users[0].id)
                    }
                })
            CapsuleText(text: "Second")
            Text("Virture")
                .modifier(PrimaryLable())
            Text("Colored ")
                .foregroundColor(.red)
                +
                Text("SwifUI ")
                .foregroundColor(.green)
                +
                Text("Text")
                .foregroundColor(.blue)
            Rectangle()
                .foregroundColor(.pink)
                .frame(height: 80, alignment: .bottom)
        }
        .padding([.horizontal, .bottom])
    }
}

struct Second_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
