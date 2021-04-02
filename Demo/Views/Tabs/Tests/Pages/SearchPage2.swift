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

struct SearchBar : UIViewRepresentable {
    @Binding var text : String
    
    class Cordinator : NSObject, UISearchBarDelegate {
        @Binding var text : String
        
        init(text : Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> SearchBar.Cordinator {
        return Cordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

struct SearchPage2_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage2()
    }
}
