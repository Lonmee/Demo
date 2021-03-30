//
//  TestsForm.swift
//  Demo
//
//  Created by Lonmee on 8/28/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct TestsView: View {
    
    private let pages: [(String, AnyView)] = [
        ("Navigations test", AnyView(Navigations())),
        ("TextFieldAndForm test", AnyView(TextFieldAndForm())),
        ("ValuePicker test", AnyView(ValuePicker())),
        ("List & Item test", AnyView(List_Item())),
        ("Large views test", AnyView(Large_views())),
        ("CoreData", AnyView(CoreDataView())),
        ("User", AnyView(UserView())),
    ]
    
    @State var creatorShown = false
    @State var listShown = false
    
    var body: some View {
        VStack{
            Form {
                ForEach(pages, id: \.self.0) { (name, instance) in
                    NavigationLink(destination: AnyView(instance)) {
                        Text(name)
                    }
                }
            }
            HStack (alignment: .center, spacing: 40){
                Button("user creator", action: {
                    creatorShown.toggle()
                })
                .frame(width: 120, height: 40, alignment: .center)
                .sheet(isPresented: $creatorShown, content: {UserCreator()})
                Button("user list", action: {
                    listShown.toggle()
                })
                .frame(width: 120, height: 40, alignment: .center)
                .sheet(isPresented: $listShown, content: {UserList()})
            }
            Spacer()
        }
    }
}

struct TestsForm_Previews: PreviewProvider {
    static var previews: some View {
        TestsView()
    }
}
