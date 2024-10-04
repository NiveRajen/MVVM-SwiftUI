//
//  Landmark.swift
//  MVVM-SwiftUI
//
//  Created by Nivedha Rajendran on 04.10.24.
//
import Foundation

struct Landmark: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var imageName: String
}
