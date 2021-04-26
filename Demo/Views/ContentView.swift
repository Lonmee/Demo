//
//  ContentView.swift
//  Demo
//
//  Created by Lonmee on 3/30/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.tabViewHidden) var tabViewHidden: Bool
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var mode
    @State private var selection: Tabs = .first
    
    private enum Tabs {
        case first
        case second
        case tests
        case fourth
    }
    
    private let tabs = [
        (Tabs.first, "1st", "1.square.fill"),
        (Tabs.second, "2nd", "2.square.fill"),
        (Tabs.tests, "3rd", "3.square.fill"),
        (Tabs.fourth, "4th", "4.square.fill"),
    ]
    
    var body: some View {
        // MARK: TabView using
        //TabView(selection: $selection) {
        //    FirstView()
        //        .tabItem {
        //            Label("First", systemImage: "1.square.fill")
        //        }
        //        .tag(Tabs.first)
        //    SecondView()
        //        .tabItem {
        //            Label("Second", systemImage: "2.square.fill")
        //        }
        //        .tag(Tabs.second)
        //    TestsView()
        //        .tabItem {
        //            Label("Tests", systemImage: "3.square.fill")
        //        }
        //        .tag(Tabs.tests)
        //}
        //.onAppear {
        //    //cModuleTest()
        //}
        //.navigationViewStyle(StackNavigationViewStyle())
        //.colorScheme(.dark)
        
        // MARK: CustomTabView using
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                getViewByTab(selection)
                Rectangle()
                    .frame(height: 0.5, alignment: .center)
                    .foregroundColor(colorScheme == .dark ?
                                        Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.6) :
                                        Color(red: 0.815, green: 0.815, blue: 0.815))
                HStack {
                    ForEach(tabs, id: \.self.0) { id, label, icon in
                        TabLabel(id: id, label: label, systemName: icon, selection: $selection)
                    }
                }
                .frame(height: 54, alignment: .center)
                .background(colorScheme == .dark ?
                                Color(red: 0.07, green: 0.07, blue: 0.07) :
                                Color(red: 0.97, green: 0.97, blue: 0.97))
                // Rectangle()
                //     .frame(height: 40)
                //     .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.97))
            }
        }
        .onAppear {
            //cModuleTest()
            print(UIApplication.shared.windows[0].safeAreaInsets)
        }
        .colorScheme(.dark)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func getViewByTab(_ tab: Tabs) -> AnyView {
        switch tab {
        case .first:
            return AnyView(FirstView())
        case .second:
            return AnyView(SecondView())
        case .tests:
            return AnyView(TestsView())
        case .fourth:
            return AnyView(FourthView())
        }
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
        ForEach(["iPhone SE", "iPhone 12 Pro Max"], id: \.self) { deviceName in
            ContentView()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
