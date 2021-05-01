//
//  Frist.swift
//  Demo
//
//  Created by Lonmee on 8/29/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct FirstView: View {
    @Environment(\.colorScheme) var colorScheme
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
        VStack(alignment: .center, spacing: 0) {
            switch selection {
            case .first:
                Image("first")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
            case .second:
                Image("second")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
            
            case .third:
                Image("third")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
            case .fourth:
                Image("fourth")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
            }
            Spacer()
            Rectangle()
                .frame(height: 0.5, alignment: .center)
                .foregroundColor(colorScheme == .dark ?
                                    Color(red: 0.4, green: 0.4, blue: 0.4, opacity: 0.6) :
                                    Color(red: 0.815, green: 0.815, blue: 0.815))
            HStack {
                ForEach(tabs, id: \.self.0) {id, label, icon in
                    TabLabel(id: id, label: label, systemName: icon, selection: $selection)
                }
            }
            .frame(height: 54, alignment: .center)
            .background(colorScheme == .dark ?
                            Color(red: 0.07, green: 0.07, blue: 0.07) :
                            Color(red: 0.97, green: 0.97, blue: 0.97))
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

struct First_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(["iPhone SE", "iPhone 12 Pro Max"], id: \.self) { deviceName in
                FirstView()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
            }
        }
    }
}
