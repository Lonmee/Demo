//
//  ContentView.swift
//  Demo
//
//  Created by Lonmee on 3/30/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var selection: Tab = .first
    
    enum Tab {
        case first
        case second
        case tests
    }
    
    var body: some View {
        TabView(selection: $selection) {
            FirstView()
                .tabItem {
                    Label("First", systemImage: "1.square.fill")
                }
                .tag(Tab.first)
            SecondView()
                .tabItem {
                    Label("Second", systemImage: "2.square.fill")
                }
                .tag(Tab.second)
            TestsView()
                .tabItem {
                    Label("Tests", systemImage: "3.square.fill")
                }
                .tag(Tab.tests)
        }
        .onAppear {
            //cModuleTest()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

private func cModuleTest() {
    printHellow()
    print("\rrandom: \(randomInt)")
    print("name: \(String(cString: getName(person)!))")
    info(person)
    destory(person)
    runSwiftFun()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
