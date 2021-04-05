//
//  SearchPage2.swift
//  Demo
//
//  Created by Lonmee on 4/2/21.
//

import SwiftUI

struct SearchPage2: View {
    let names = ["Raju", "Ghanshyam", "Baburao Ganpatrao Apte", "Anuradha", "Kabira", "Chaman Jhinga", "Devi Prasad", "Khadak Singh"]
    
    @State private var searchTerm : String = ""
    
    var body: some View {
        List {
            SearchBar(text: $searchTerm)
            ForEach(self.names.filter{
                self.searchTerm.isEmpty ? true : $0.localizedStandardContains(self.searchTerm)
            }, id: \.self) { name in
                Text(name)
            }
        }
        .navigationBarTitle(Text("Search Bar"))
    }
}
