//
//  TabLabel.swift
//  Demo
//
//  Created by Lonmee on 4/26/21.
//

import SwiftUI

struct TabLabel<T>: View where T: Equatable {
    let id: T
    let label: String
    let systemName: String
    @Binding var selection: T
    var body: some View {
        Spacer()
        Button(action: {
            withTransaction(Transaction(animation: .easeInOut(duration: 1))) {
                selection = id
            }
        }, label: {
            VStack(alignment: .center, spacing: 2) {
                Image(systemName: systemName)
                    .font(.title2)
                Text(label)
                    .font(.caption)
            }
        })
        .foregroundColor(selection == self.id ? .accentColor : .gray)
        Spacer()
    }
}
