//
//  Frist.swift
//  Demo
//
//  Created by Lonmee on 8/29/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("ao3jn7")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                Spacer()
            }
            .navigationTitle("First")
        }
    }
}

struct First_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
