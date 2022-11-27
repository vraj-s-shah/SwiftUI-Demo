//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Vraj Shah on 17/11/22.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    @StateObject private var landmarkObservableObject = LandmarkObservableObject()
    
    var body: some Scene {
        WindowGroup {
            LandmarkList()
                .environmentObject(landmarkObservableObject)
        }
    }
}
