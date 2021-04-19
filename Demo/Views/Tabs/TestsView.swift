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
        ("ValuePicker test", AnyView(ValuePicker())),
        ("List & Item test", AnyView(List_Item())),
        ("Large views test", AnyView(Large_views())),
        ("CoreData", AnyView(CoreDataView())),
        ("User", AnyView(UserView())),
        ("Search", AnyView(SearchPage())),
        ("Search2", AnyView(SearchPage2())),
    ]
    
    @State var creatorShown = false
    @State var listShown = false
    
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    ForEach(pages, id: \.self.0) { (name, instance) in
                        NavigationLink(destination: AnyView(instance)) {
                            Text(name)
                        }
                    }
                }
                NavigationLink(
                    destination:
                        ImagePickerController(sourceType: .savedPhotosAlbum)
                        .navigationBarHidden(true)
                        .statusBar(hidden: true)
                        .tabViewHidden(true)
                ) { Text("camera") }
                HStack (alignment: .center, spacing: 40){
                    Button("user creator", action: {
                        creatorShown.toggle()
                    })
                    .frame(width: 120, height: 40, alignment: .center)
                    .sheet(isPresented: $creatorShown, content: {ImagePickerController(sourceType: .camera)})
                    Button("user list", action: {
                        listShown.toggle()
                    })
                    .frame(width: 120, height: 40, alignment: .center)
                    .sheet(isPresented: $listShown, content: {ImagePickerController(sourceType: .savedPhotosAlbum)})
                }
                Spacer()
            }
            .navigationTitle("Tests")
        }
    }
}

struct TestsForm_Previews: PreviewProvider {
    static var previews: some View {
        TestsView()
    }
}
