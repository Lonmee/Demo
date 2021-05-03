//
//  TestsForm.swift
//  Demo
//
//  Created by Lonmee on 8/28/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI
import Foundation

struct TestsView: View {
    
    private let pages: [(String, AnyView)] = [
        ("Navigations test", AnyView(Navigations())),
        ("TextFieldAndForm test", AnyView(TextFieldAndForm())),
        ("ControlsView", AnyView(ControlsView())),
        ("List & Item test", AnyView(List_Item())),
        ("Large views test", AnyView(Large_views())),
        ("CoreData", AnyView(CoreDataView())),
        ("User", AnyView(UserView())),
        ("Search", AnyView(SearchPage())),
    ]
    
    var body: some View {
        Image("10eiy63")
            .resizable()
            .scaledToFill()
            .frame(minHeight: 100, maxHeight: 200)
            .clipped()
        Form {
            ForEach(pages, id: \.self.0) { (name, instance) in
                NavigationLink(destination: AnyView(instance)) {
                    Text(name)
                }
            }
        }
        PickerTestEntry()
    }
}

struct TestsForm_Previews: PreviewProvider {
    static var previews: some View {
        TestsView()
    }
}
