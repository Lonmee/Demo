//
//  FourthView.swift
//  Demo
//
//  Created by Lonmee on 4/26/21.
//

import SwiftUI

struct FourthView: View {
    var body: some View {
        VStack {
            Text("This text is outside of the top safe area.")
                .edgesIgnoringSafeArea(.top)
                .border(Color.purple)
            Spacer()
            Text("This text is inside VStack.")
                .edgesIgnoringSafeArea(.bottom)
                .border(Color.yellow)
        }
        .navigationTitle("Fourth")
        .border(Color.gray)
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}
