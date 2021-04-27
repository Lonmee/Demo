//
//  ValuePicker.swift
//  Demo
//
//  Created by Lonmee on 8/12/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct ControlsView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var data: String = ""
    @State var submit: Bool = false
    @State var darkModeOn: Bool = false
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
            Toggle("Dark mode", isOn: $darkModeOn)
                .toggleStyle(SwitchToggleStyle())
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
//        .preferredColorScheme(darkModeOn ? .dark : .light)
    }
    
    init() {
        print("ControlsView init")
    }
}

struct ValuePicker_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView()
    }
}
