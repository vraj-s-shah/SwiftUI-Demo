//
//  MapScreen.swift
//  SwiftUIDemo
//
//  Created by Vraj Shah on 22/11/22.
//

import SwiftUI
import MapKit

struct PracticeScreen: View {
    
    @EnvironmentObject var landmarkObservableObject: LandmarkObservableObject
    var landmark: Landmark
    
    var currentIndex: Int {
        return landmarkObservableObject.landmarks.firstIndex(where: { $0.id == landmark.id }) ?? 0
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CustomizedCircularImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isFav: $landmarkObservableObject.landmarks[currentIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    }
}

struct CustomizedCircularImage: View {
    let image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 5)
            }
            .shadow(radius: 10)
    }
}

struct FavoriteButton: View {
    @Binding var isFav: Bool
    
    var body: some View {
        Button {
            isFav.toggle()
        } label: {
            Image(systemName: isFav ? "star.fill" : "star")
                .foregroundColor(isFav ? .yellow : .gray)
        }
    }
}
