//
//  NetworkingError.swift
//  MVVM-SwiftUI
//
//  Created by Nivedha Rajendran on 04.10.24.
//

import Foundation

enum NetworkingError: Error {
    case unableToParseData
    case unableToLoadResource
    case resourceNotFound
    case unableToCreateURL
    case urlSessionError
    case httpFailureResponseCode
    case noDataRecieved
}
