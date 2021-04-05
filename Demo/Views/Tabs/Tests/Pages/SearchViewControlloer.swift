//
//  SearchViewControlloer.swift
//  Demo
//
//  Created by Lonmee on 4/5/21.
//

import SwiftUI
import UIKit

struct SearchViewController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        print("update SearchPageViewController")
    }
    
}

struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchViewController()
    }
}
