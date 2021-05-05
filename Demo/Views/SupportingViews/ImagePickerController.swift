//
//  ImageController.swift
//  Demo
//
//  Created by Lonmee on 4/17/21.
//

import SwiftUI
import UIKit
import PhotosUI
import Foundation

struct ImagePickerController: UIViewControllerRepresentable  {
    @Environment(\.presentationMode) var presentationMode
    @State var sourceType: UIImagePickerController.SourceType
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        
        if sourceType == .camera {
            // picker.mediaTypes = ["public.image", "public.movie"]
            picker.showsCameraControls = true
            picker.cameraDevice = .front
        } else {
            picker.allowsEditing = true
//            NotificationCenter.default.addObserver(forName: nil, object: nil, queue: OperationQueue.main) { note in
//                print(note)
//            }
        }
        
        return picker
    }
    
    func updateUIViewController(_ picker: UIImagePickerController, context: Context) {
        // MARK: print("update")
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
        var parent: ImagePickerController
        
        init(_ imagePickerController: ImagePickerController) {
            parent = imagePickerController
        }
        
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            _ = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as! UIImage
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
            
        }
        
        func UIImageWriteToSavedPhotosAlbum(_ image: UIImage, _ completionTarget: Any?, _ completionSelector: Selector?, _ contextInfo: UnsafeMutableRawPointer?) {
            
        }
    }
}
