//
//  PrimaryLable.swift
//  Demo
//
//  Created by Lonmee on 9/9/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct PrimaryLable: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.primary)
            .background(Color.secondary)
            .font(.largeTitle)
    }
}

struct Modifiers_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
            .modifier(PrimaryLable())
    }
}
