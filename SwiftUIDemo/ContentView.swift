//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Vraj Shah on 17/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAlertVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .getBaseText()
                .font(.system(size: 13, weight: .bold))
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .padding(.horizontal, 40)
            Text("89")
                .getBaseText()
                .kerning(2.0)
                .font(.system(size: 36, weight: .black))
                .padding(.top, 5)
            
            HStack {
                Text("1")
                    .getBaseText()
                    .font(.system(size: 18, weight: .bold))
                Slider(value: .constant(89), in: 1.0...100.0)
                Text("100")
                    .getBaseText()
                    .font(.system(size: 18, weight: .bold))
            }
            .padding(.top, 25)
            .offset(y: -15)
            Button(action: {
                self.isAlertVisible = true
            }) {
                BaseButton(label: "HIT ME")
                    .offset(y: 35)
            }
        }
        .background(
            Image("HomeScreenBackgroundImage")
                .offset(y: 30)
        )
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Text {
    func getBaseText() -> Text {
        return self
            .foregroundColor(Color("BlackTextColor"))
    }
}

struct BaseButton: View {
    
    let label: String
    
    var body: some View {
        Text(label)
            .font(.system(size: 21, weight: .bold))
            .kerning(1.0)
            .foregroundColor(.white)
            .padding(.horizontal, 24)
            .padding(.vertical, 22)
            .overlay(
                RoundedRectangle(cornerRadius: 21)
                    .stroke(.white, lineWidth: 3)
            )
            .background(
                Color("HitMeButtonBackground")
                    .overlay(
                        LinearGradient(colors: [Color("WhiteO30Color"), Color("TransparentColor")], startPoint: UnitPoint.top, endPoint: UnitPoint.bottom)
                    )
            )
            .cornerRadius(21)
            .shadow(color: Color("ButtonShadowColor"), radius:74, x: 23, y: 23)
    }
}
