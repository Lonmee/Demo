//
//  FourthView.swift
//  Demo
//
//  Created by Lonmee on 4/26/21.
//

import SwiftUI

struct FourthView: View {
    @State private var offset = CGFloat.zero
    
    @State private var fruits = [
        "Apple",
        "Banana",
        "Papaya",
        "Mango",
        "Apple",
        "Banana",
        "Papaya",
        "Mango",
        "Apple",
        "Banana",
        "Papaya",
        "Mango",
        "Apple",
        "Banana",
        "Papaya",
        "Mango",
        "Apple",
        "Banana",
        "Papaya",
        "Mango",
        "Apple",
        "Banana",
        "Papaya",
        "Mango",
    ]
    
    var body: some View {
//        Image("10dzrq9")
//            .resizable()
//            .scaledToFill()
//            .frame(height: 200)
//            .clipped()
        List {
            ForEach(
                fruits,
                id: \.self
            ) { fruit in
                Text(fruit)
            }
            .onDelete { self.deleteFruit(at :$0) }
            .onMove { self.moveFruit(from: $0, to: $1) }
            .background(GeometryReader { proxy in
                Color.clear.preference(key: ViewOffsetKey.self, value: proxy.frame(in: .named("list")).origin.y)
            })
            .onPreferenceChange(ViewOffsetKey.self) { value in
                debugPrint("offset: \(value)")
            }
        }
//        .coordinateSpace(name: "list")
        .navigationTitle("Fruits")
        .toolbar { EditButton() }
    }
    
    func deleteFruit(at: IndexSet) -> Void {
        
    }
    
    func moveFruit(from: IndexSet, to: Int) -> Void {
        print("from: \(from.startIndex), to: \(to)")
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}
