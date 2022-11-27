//
//  LandmarkList.swift
//  SwiftUIDemo
//
//  Created by Vraj Shah on 27/11/22.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var landmarkObservableObject: LandmarkObservableObject
    @State var showFavOnly: Bool = false
    
    private var favoriteLandmarks: [Landmark] {
        landmarkObservableObject.landmarks.filter { landmark in
            landmark.isFavorite == true
        }
    }
    private var landmarkList: [Landmark] {
        return showFavOnly ? favoriteLandmarks : landmarkObservableObject.landmarks
    }
    
    var body: some View {
        NavigationStack {
            List {
                Toggle(isOn: $showFavOnly) {
                    Text("Favorites only")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 10)
                }
                .listRowSeparator(.hidden)
                ForEach(landmarkList, id: \.id) { landmark in
                    NavigationLink {
                        PracticeScreen(landmark: landmark)
                    } label: {
                        LandmarkItem(landmark: landmark)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .alignmentGuide(.listRowSeparatorLeading) { dimensions in
                        dimensions[.leading]
                    }
                    .alignmentGuide(.listRowSeparatorTrailing) { dimensions in
                        dimensions[.trailing]
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}
