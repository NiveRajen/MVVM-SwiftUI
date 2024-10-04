//
//  Alert.swift
//  MVVM-SwiftUI
//
//  Created by Nivedha Rajendran on 04.10.24.
//
import Foundation

struct AlertData: Identifiable {
    var id = UUID()
    var title: String
    var message: String
    var dismissButton: String
}
