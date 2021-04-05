//
//  SearchPage.swift
//  Demo
//
//  Created by Lonmee on 4/2/21.
//
import SwiftUI

struct SearchPage: View {
    @State var text = ""
    var body: some View {
        SearchViewController()
            .navigationBarItems(leading: SearchBar(text: $text))
    }
}

struct SearchViewControlloer_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage()
    }
}
