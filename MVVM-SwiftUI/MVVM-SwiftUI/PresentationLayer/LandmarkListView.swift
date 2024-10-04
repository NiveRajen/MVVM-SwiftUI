//
//  ContentView.swift
//  MVVM-SwiftUI
//
//  Created by Nivedha Rajendran on 04.10.24.
//

import SwiftUI

struct LandmarkListView: View {
    @StateObject private var landmarkListViewModel = LandmarkListViewModel()
    
    var body: some View {
        ZStack {
                List(landmarkListViewModel.landmarks) { landmark in
                    LandmarkRow(landmark:landmark)
                }
                .navigationTitle("Landmarks")
                .onAppear { landmarkListViewModel.refreshLandmarks() }
                
                if landmarkListViewModel.isLoading { LoadingView() }
            }
            
            .alert(item: $landmarkListViewModel.alertData) { alertItem in
                return Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: .default(Text(alertItem.dismissButton)))
            }
    }
}

#Preview {
    LandmarkListView()
}
