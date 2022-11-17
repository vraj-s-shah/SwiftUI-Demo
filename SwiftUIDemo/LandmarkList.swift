//
//  LandmarkList.swift
//  SwiftUIDemo
//
//  Created by Vraj Shah on 27/11/22.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationStack {
            List(landmarks, id: \.id) { landmark in
                NavigationLink {
                    PracticeScreen(landmark: landmark)
                } label: {
                    LandmarkItem(landmark: landmark)
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
