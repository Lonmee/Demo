//
//  UserTools.swift
//  Demo
//
//  Created by Lonmee on 10/27/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import Foundation
import SwiftUI
struct UserTools: Identifiable {
    var id = UUID()
    var view: AnyView?
    
    init(view: AnyView) {
        self.view = view
    }
}
