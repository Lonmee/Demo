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
    
    @State var cameraShown = false
    @State var albumShown = false
    
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
        Divider()
        Text("in page")
            .font(.footnote)
            .foregroundColor(.secondary)
        Divider()
        HStack {
            Spacer()
            NavigationLink(
                destination:
                    ImagePickerController(sourceType: .camera)
                    .navigationBarHidden(true)
                    .statusBar(hidden: true)
                    .tabViewHidden(true)
            ) { Text("camera") }
            Spacer()
            Divider()
            Spacer()
            NavigationLink(
                destination: ImagePickerController(sourceType: .savedPhotosAlbum)
                    .navigationBarHidden(true)
                    .statusBar(hidden: true)
                    .tabViewHidden(true)
            ) { Text("album") }
            Spacer()
        }
        .frame(height: 40)
        Divider()
        Text("in sheet")
            .font(.footnote)
            .foregroundColor(.secondary)
        Divider()
        HStack {
            Spacer()
            Button("camera", action: {
                cameraShown.toggle()
            })
            .sheet(isPresented: $cameraShown, content: {ImagePickerController(sourceType: .camera)})
            Spacer()
            Divider()
            Spacer()
            Button("album", action: {
                albumShown.toggle()
            })
            .sheet(isPresented: $albumShown, content: {ImagePickerController(sourceType: .savedPhotosAlbum)})
            Spacer()
        }
        .frame(height: 40)
    }
}

struct TestsForm_Previews: PreviewProvider {
    static var previews: some View {
        TestsView()
    }
}
