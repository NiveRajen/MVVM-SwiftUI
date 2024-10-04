//
//  MVVM_SwiftUIApp.swift
//  MVVM-SwiftUI
//
//  Created by Nivedha Rajendran on 04.10.24.
//

import SwiftUI

@main
struct MVVM_SwiftUIApp: App {
    
    @StateObject private var landmarksMockData = LandmarksMockData()
    
    var body: some Scene {
        WindowGroup {
            LandmarkListView()
                .environmentObject(landmarksMockData)
        }
    }
}
