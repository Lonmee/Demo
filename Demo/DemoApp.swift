//
//  DemoApp.swift
//  Demo
//
//  Created by Lonmee on 3/30/21.
//

import SwiftUI

private struct MyEnvironmentKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var tabViewHidden: Bool {
        get { self[MyEnvironmentKey.self] }
        set { self[MyEnvironmentKey.self] = newValue }
    }
}

extension View {
    func tabViewHidden(_ tabViewHidden: Bool) -> some View {
        environment(\.tabViewHidden, tabViewHidden)
    }
}

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
        .onChange(of: scenePhase) { newScenePhase in
            //  switch newScenePhase {
            //  case .active:
            //      print("active")
            //  case .inactive:
            //      print("inactive")
            //  case .background:
            //      print("background")
            //  default:
            //      print(scenePhase.self)
            //  }
        }
    }
}
