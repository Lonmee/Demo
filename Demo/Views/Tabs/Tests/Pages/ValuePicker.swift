//
//  ValuePicker.swift
//  Demo
//
//  Created by Lonmee on 8/12/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct ValuePicker: View {
    @State var data: String = ""
    @State var submit: Bool = false
    let pickerList = ["male", "female", "both"]
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack (alignment: .center, spacing: 40) {
                Text("selected value: \(data)")
                Spacer()
                Picker(selection: $data, label: Text("Picker")) {
                    ForEach(pickerList, id: \.self) { value in
                        Text(String(value)).tag(value)
                    }
                }
                .labelsHidden()
                .frame(width: 120, height: 80, alignment: .center)
                .clipped()
            }
            Button(action: { self.submit.toggle() }) {
                Text("Submit")
            }
            Spacer()
        }
        .padding(.all)
        .navigationBarTitle(Text("Picker test"))
        .onAppear {
            self.data = self.pickerList[0]
        }
        .alert(isPresented: $submit, content: {
            Alert(title: Text("Submitted"), message: Text("Value: \(data)"))
        })
    }
}

struct ValuePicker_Previews: PreviewProvider {
    static var previews: some View {
        ValuePicker()
    }
}
