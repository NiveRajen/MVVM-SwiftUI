//
//  LandmarksMockData.swift
//  MVVM-SwiftUI
//
//  Created by Nivedha Rajendran on 04.10.24.
//


import Foundation

class LandmarksMockData: ObservableObject {
    
    var landmarks: [Landmark] = MockData.load("landmarkData.json")
}
