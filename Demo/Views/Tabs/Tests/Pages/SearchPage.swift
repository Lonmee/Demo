//
//  SearchPage.swift
//  Demo
//
//  Created by Lonmee on 4/2/21.
//

import SwiftUI

struct SearchPageViewController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        print("update SearchPageViewController")
    }
    
}

struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageViewController()
    }
}
