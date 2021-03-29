//
//  DemoApp.swift
//  Demo
//
//  Created by Lonmee on 3/30/21.
//

import SwiftUI

@main
struct DemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
