//
//  StateExample.swift
//  SwiftUIDemo
//
//  Created by Vraj Shah on 19/11/22.
//

import SwiftUI

struct StateExample: View {
    
    @State private var opacity: CGFloat = 0
    @State private var buttonText: String = "Hit me"
    
    var body: some View {
        VStack {
            CustomizedCircularImage(image: Image("SwiftLogo"))
            Spacer()
                .frame(height: 30)
            ProgressView()
                .progressViewStyle(.circular)
                .opacity(opacity)
                .controlSize(.large)
                .tint(.red)
            Spacer()
                .frame(height: 40)
            Button {
                opacity = 1
                buttonText = "Please wait"
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
                    opacity = 0
                    buttonText = "Welcome"
                }
            } label: {
                BaseButton(label: buttonText)
            }
        }
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        .background(Color("LightYellowColor"))
        .padding()
    }
}

struct StateExample_Previews: PreviewProvider {
    static var previews: some View {
        StateExample()
    }
}
