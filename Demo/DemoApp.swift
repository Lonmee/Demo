//
//  DemoApp.swift
//  Demo
//
//  Created by Lonmee on 3/30/21.
//

import SwiftUI

@main
struct DemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate
    
//    @Environment(\.scenePhase)
//    var scenePhase
    
    @StateObject
    private var modelData = ModelData()
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
