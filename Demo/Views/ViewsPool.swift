//
//  ViewsPool.swift
//  Demo
//
//  Created by Lonmee on 4/27/21.
//

import SwiftUI

class ViewsPool: NSObject {
    enum Tabs: Int {
        case first
        case second
        case tests
        case fourth
    }
    
    static let tabs = [
        (Tabs.first, "1st", "1.square.fill", AnyView(FirstView())),
        (Tabs.second, "2nd", "2.square.fill", AnyView(SecondView())),
        (Tabs.tests, "3rd", "3.square.fill", AnyView(TestsView())),
        (Tabs.fourth, "4th", "4.square.fill", AnyView(FourthView())),
    ]
}
