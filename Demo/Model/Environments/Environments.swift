//
//  Environments.swift
//  Demo
//
//  Created by Lonmee on 4/25/21.
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
