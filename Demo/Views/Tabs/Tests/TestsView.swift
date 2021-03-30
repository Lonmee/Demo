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
        ("User", AnyView(UserView())),
    ]
    @State var userTools: UserTools? = nil
    @State var show: Bool = false
    
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
                    self.userTools = UserTools(view: AnyView(UserCreator()))
                })
                .frame(width: 120, height: 40, alignment: .center)
                Button("user list", action: {
                    self.userTools = UserTools(view: AnyView(UserList()))
                    self.show.toggle()
                })
                .frame(width: 120, height: 40, alignment: .center)
            }
            Spacer()
        }
        .sheet(item: $userTools, content: {tool -> AnyView in
            AnyView(tool.view)
        })
    }
}

struct TestsForm_Previews: PreviewProvider {
    static var previews: some View {
        TestsView()
    }
}
