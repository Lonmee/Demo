//
//  SubView0.swift
//  Demo
//
//  Created by Lonmee on 8/11/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct SubNavigation: View {
    var subTitleNo: Int
    
    var body: some View {
        NavigationLink(destination: SubNavigation(subTitleNo: subTitleNo + 1)) {
            Text("Go next navigation: \(subTitleNo + 1)")
        }
        .navigationBarTitle("Navigation\(subTitleNo)")
        .onAppear {
            print("sub appear")
        }
    }
}
