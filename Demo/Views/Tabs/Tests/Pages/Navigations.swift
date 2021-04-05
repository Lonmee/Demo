//
//  Navigations.swift
//  Demo
//
//  Created by Lonmee on 8/11/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct Navigations: View {
    let subTitleNo = 1
    var body: some View {
        NavigationLink(destination: SubNavigation(subTitleNo: subTitleNo)) {
            Text("Go navigation: \(subTitleNo)")
        }
        .navigationBarTitle(Text("Navigations"))
        .onAppear {
            print("main appear")
        }
    }
}

struct Navigations_Previews: PreviewProvider {
    static var previews: some View {
        Navigations()
    }
}
