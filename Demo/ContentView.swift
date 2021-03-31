//
//  ContentView.swift
//  Demo
//
//  Created by Lonmee on 3/30/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let tabs = ["First", "Second", "Tests"]
    @State var sellected = ""
    
    var body: some View {
        TabView(selection: $sellected) {
            FirstView()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text(tabs[0])
                }
                .tag(tabs[0])
            SecondView()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text(tabs[1])
                }
                .tag(tabs[1])
            TestsView()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text(tabs[2])
                }
                .tag(tabs[2])
        }
        .onAppear {
            self.sellected = self.tabs[0]
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
