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
    
    enum Tabs {
        case first
        case second
        case third
        case fourth
    }
    
    let tabs = [
        (Tabs.first, "1st", "1.square.fill"),
        (Tabs.second, "2nd", "2.square.fill"),
        (Tabs.third, "3rd", "3.square.fill"),
        (Tabs.fourth, "4th", "4.square.fill"),
    ]
    
    var body: some View {
        // MARK: TabView using
        // TabView(selection: $selection) {
        //     FirstView()
        //         .tabItem {
        //             Label("First", systemImage: "1.square.fill")
        //         }
        //         .tag(ViewsPool.Tabs.first)
        //     SecondView()
        //         .tabItem {
        //             Label("Second", systemImage: "2.square.fill")
        //         }
        //         .tag(ViewsPool.Tabs.second)
        //
        //     TestsView()
        //         .tabItem {
        //             Label("Tests", systemImage: "3.square.fill")
        //         }
        //         .tag(ViewsPool.Tabs.tests)
        // }
        // .onAppear {
        //     //cModuleTest()
        // }
        // .navigationViewStyle(StackNavigationViewStyle())
        
        // MARK: CustomTabView using
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                switch selection {
                case .first:
                    FirstView()
                case .second:
                    SecondView()
                case .third:
                    TestsView()
                case .fourth:
                    FourthView()
                }
                Divider()
                    .background(colorScheme == .dark ?
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
                
                if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != "1" &&
                    UIApplication.shared.windows[0].safeAreaInsets.bottom > 0 {
                    Rectangle()
                        .frame(height: 40)
                        .foregroundColor(colorScheme == .dark ?
                                            Color(red: 0.07, green: 0.07, blue: 0.07) :
                                            Color(red: 0.97, green: 0.97, blue: 0.97))
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        .navigationBarHidden(true)
        .onAppear {
            // cModuleTest()
            
            // MARK: for stringsdic using
            // let format = NSLocalizedString("%d file(s) remaining", tableName: "Plurals", comment: "")
            // let str = String.localizedStringWithFormat(format, 0)
            // print(str)
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
        ForEach(["iPhone SE", "iPhone 12 Pro Max"], id: \.self) { deviceName in
            ContentView()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
