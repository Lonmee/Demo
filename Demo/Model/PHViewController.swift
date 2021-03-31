//
//  File.swift
//  Demo
//
//  Created by Lonmee on 3/31/21.
//

import SwiftUI
import UIKit
import PhotosUI

struct SPHPickerViewController: UIViewControllerRepresentable  {
    @Environment(\.presentationMode) var mode
    @Binding var results: [PHPickerResult]
    let configuration: PHPickerConfiguration
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ pHPickerViewController: PHPickerViewController, context: Context) {
        // print("update")
    }
    
    class Coordinator: PHPickerViewControllerDelegate {
        var parent: SPHPickerViewController
        
        init(_ sPHPickerViewController: SPHPickerViewController) {
            parent = sPHPickerViewController
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.mode.wrappedValue.dismiss()
            parent.results = results
        }
        
    }
}
