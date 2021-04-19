//
//  TextFieldAndForm.swift
//  Demo
//
//  Created by Lonmee on 8/24/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct TextFieldAndForm: View {
    @State var data: String = ""
    @State var str: String = ""
    let pickerList = ["female", "male", "both"]
    
    var body: some View {
        VStack {
            TextField("title", text: Binding<String>(
                get: { self.str },
                set: {
                    self.str = $0
                    print("inputting \($0)")
            }),
                      onEditingChanged: {on in
                        print(on ? "focused" : "blured")
            },
                      onCommit: {
                        print("\(self.str)")
            })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Form {
                Section (header: Text("First")) {
                    Text("Form")
                    Text("Form")
                    Text("Form")
                }
                Section (header: Text("Second")) {
                    Text("Form")
                    Text("Form")
                    Text("Form")
                }
                Section (header: Text("Thrid")) {
                    Text("Form")
                    Text("Form")
                    Text("Form")
                }
            }
            .padding(EdgeInsets())
            .navigationBarTitle(Text("TextFieldAndForm"))
        }
    }
}

struct TextFieldAndForm_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldAndForm()
    }
}
