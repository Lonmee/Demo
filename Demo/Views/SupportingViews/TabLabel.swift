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
            $selection.animation(.easeInOut(duration: 0.3)).wrappedValue = id
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

struct TabLabel_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            TabLabel(id: 0, label: "1.st", systemName: "1.square.fill", selection: .constant(0))
            TabLabel(id: 1, label: "2.nd", systemName: "2.square.fill", selection: .constant(1))
            TabLabel(id: 2, label: "3.rd", systemName: "3.square.fill", selection: .constant(2))
            TabLabel(id: 3, label: "4.th", systemName: "4.square.fill", selection: .constant(3))
        }
    }
}
