//
//  LandmarkListViewModel.swift
//  MVVM-SwiftUI
//
//  Created by Nivedha Rajendran on 04.10.24.
//

import Foundation

class LandmarkListViewModel: ObservableObject {
    @Published var landmarks: [Landmark] = []
    
    @Published var isLoading: Bool = false
    
    @Published var alertData: AlertData?
    
    func refreshLandmarks() {
        isLoading = true
        
        NetworkingManager.shared.fetchLandmarks { [weak self] result in
            
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
                
                switch result {
                case .success(let newLandmarks):
                    self?.landmarks = newLandmarks
                    
                case .failure(let error):
                    switch error {
                    case .resourceNotFound:
                        self?.alertData = ServerErrorAlert.resourceNotFound
                        
                    case .unableToLoadResource:
                        self?.alertData = ServerErrorAlert.unableToLoadResource
                        
                    case .unableToParseData:
                        self?.alertData = ServerErrorAlert.unableToParseData
                        
                    case .unableToCreateURL:
                        self?.alertData = ServerErrorAlert.unableToCreateURL
                        
                    case .urlSessionError:
                        self?.alertData = ServerErrorAlert.urlSessionError
                        
                    case .httpFailureResponseCode:
                        self?.alertData = ServerErrorAlert.httpFailureResponseCode
                        
                    case .noDataRecieved:
                        self?.alertData = ServerErrorAlert.noDataRecieved
                    }
                }
            }
        }
    }
}
