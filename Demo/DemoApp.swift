//
//  DemoApp.swift
//  Demo
//
//  Created by Lonmee on 3/30/21.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) -> Void {
        print("MemoryWarning")
    }
}

@main
struct DemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate
    @Environment(\.scenePhase)
    var scenePhase
    @StateObject private var modelData = ModelData()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { scenePhase in
//            switch scenePhase {
//            case .active:
//                print("active")
//            case .inactive:
//                print("inactive")
//            case .background:
//                print("background")
//            default:
//                print(scenePhase.self)
//            }
        }
    }
}
