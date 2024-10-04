//
//  LandmarksMockData.swift
//  MVVM-SwiftUI
//
//  Created by Nivedha Rajendran on 04.10.24.
//


import Foundation

struct LandmarksMockData {
    
    let landmarks: [Landmark] = MockData.load("landmarkData.json")
}
