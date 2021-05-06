//
//  ImagePreviewer.swift
//  Demo
//
//  Created by Lonmee on 5/6/21.
//

import SwiftUI

struct ImagePreviewer: View {
    var img: Image
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1
    
    @State private var roCurrentAmount: Angle = .degrees(0)
        @State private var roFinalAmount: Angle = .degrees(0)

    
    var magnification: some Gesture {
        MagnificationGesture()
            .onChanged{ value in
                self.currentAmount = value - 1
            }
            .onEnded { value in
                self.finalAmount += self.currentAmount
                self.currentAmount = 0
            }
    }
    
    fileprivate var maskView: some View {
        Rectangle().mask(
            Rectangle()
                .clipShape(Circle()))
    }
    
    var body: some View {
        ZStack {
            img
                .resizable()
                .scaledToFill()
                .rotationEffect(roCurrentAmount + roFinalAmount)
                .scaleEffect(finalAmount + currentAmount)
                .navigationBarHidden(true)
                .mask(Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width, alignment: .center)
                        .opacity(0.5)
                        .overlay(Circle()))
        }
        .gesture(magnification)
        .gesture(RotationGesture()
                    .onChanged { angle in
                        self.roCurrentAmount = angle
                    }
                    .onEnded { angle in
                        self.roFinalAmount += self.roCurrentAmount
                        self.roCurrentAmount = .degrees(0)
                    })
    }
    
    init(_ img: Image) {
        self.img = img
    }
}

struct ImagePreviewer_Previews: PreviewProvider {
    static var previews: some View {
        ImagePreviewer(Image("IMG_F75DAC7E7AA3-1"))
    }
}
