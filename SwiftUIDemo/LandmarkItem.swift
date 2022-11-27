//
//  LandmarkItem.swift
//  SwiftUIDemo
//
//  Created by Vraj Shah on 22/11/22.
//

import SwiftUI

struct LandmarkItem: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            Image(systemName: landmark.isFavorite ? "star.fill" : "star")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(landmark.isFavorite ? .yellow : .gray)
        }
    }
}
