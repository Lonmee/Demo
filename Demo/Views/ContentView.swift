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
    @Environment(\.presentationMode) var mode
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
            checkTabViewBar()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func checkTabViewBar() -> Void {
        let windows = UIApplication.shared.windows
        let mw = windows.filter({ $0.windowLevel == .normal })[0]
        //        mw.subviews[0].subviews[0].subviews[0].subviews[0].subviews[0].subviews[1].isHidden = tabViewHidden
        //        print(type(of: mw.subviews[0].subviews[0].subviews[0].subviews[0].subviews[0].subviews[1]) == UITabBar.self)
        print(type(of: mw.subviews[0].subviews[0].subviews[0].subviews[0].subviews[0].subviews[1].delegate))
//        tabView.hidesBottomBarWhenPushed = true
//        print(type(of: mw.subviews[0].subviews[0].subviews[0]))
    }
    
    private func find<T, V>(_ typee: T.Type, views: [V]) -> T? where T: UIView, V: UIView {
        print(views.count)
        for v in views {
            print(type(of: v))
            if type(of: v) == typee {
                return v as? T
            } else {
                return find(typee, views: v.subviews)
            }
        }
        return nil
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
