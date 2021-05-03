//
//  PickerTestEntry.swift
//  Demo
//
//  Created by Lonmee on 5/2/21.
//

import SwiftUI

struct PickerTestEntry: View {
    @State private var cameraShown = false
    @State private var albumShown = false
    @State private var showAlert = false
    
    fileprivate var maskView: some View {
        VStack(spacing: 0) {
            Rectangle().frame(height: 45)
            Rectangle()
                .opacity(0.5)
                .overlay(Circle())
            Rectangle().frame(height: 123)
        }
    }
    
    private var CameraLink: AnyView {
        AnyView(NavigationLink(
            destination:
                ImagePickerController(sourceType: .camera)
                .mask(maskView)
                .navigationBarHidden(true)
                .statusBar(hidden: true)
        ) { Text("camera") })
    }
    
    private var AlbumLink: AnyView {
        AnyView( NavigationLink(
            destination: ImagePickerController(sourceType: .savedPhotosAlbum)
                .navigationBarHidden(true)
                .statusBar(hidden: true)
                .tabViewHidden(true)
        ) { Text("album") })
    }
    
    private var CameraSheet: AnyView {
        AnyView(Button("camera", action: {
            cameraShown.toggle()
        })
        .sheet(isPresented: $cameraShown, content: {ImagePickerController(sourceType: .camera)}))
    }
    
    private var AlbumSheet: AnyView {
        AnyView(Button("album", action: {
            albumShown.toggle()
        })
        .sheet(isPresented: $albumShown, content: {ImagePickerController(sourceType: .savedPhotosAlbum)}))
    }
    
    fileprivate var AlertButton: some View {
        Button("camera invalid", action: {
            showAlert = true
        })
        .foregroundColor(.red)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Current Camera Not Available"),
                message: Text("Your current camera can’t be " +
                                "determined at this time.")
            )
        }
    }
    
    fileprivate func getButtons<T>(cameraCtl: T, albumCtl: T) -> some View where T: View {
        return HStack(spacing: 0) {
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                cameraCtl
                    .frame(width: UIScreen.main.bounds.width / 2)
            } else {
                AlertButton
                    .frame(width: UIScreen.main.bounds.width / 2)
            }
            Divider()
            albumCtl
                .frame(width: UIScreen.main.bounds.width / 2)
        }
        .frame(height: 26.0)
    }
    
    var body: some View {
        Divider()
        Text("in page")
            .font(.footnote)
            .foregroundColor(.secondary)
        Divider()
        getButtons(cameraCtl: CameraLink, albumCtl: AlbumLink)
        Divider()
        Text("in sheet")
            .font(.footnote)
            .foregroundColor(.secondary)
        Divider()
        getButtons(cameraCtl: CameraSheet, albumCtl: AlbumSheet)
    }
}

struct PickerTestEntry_Previews: PreviewProvider {
    static var previews: some View {
        PickerTestEntry()
    }
}
