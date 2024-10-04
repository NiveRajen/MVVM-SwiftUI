//
//  ContentView.swift
//  MVVM-SwiftUI
//
//  Created by Nivedha Rajendran on 04.10.24.
//

import SwiftUI

struct LandmarkListView: View {
    
    @EnvironmentObject var modelData: LandmarksMockData
    
    @StateObject private var landmarkListViewModel = LandmarkListViewModel()
    
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            return (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
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


struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
            .environmentObject(LandmarksMockData())
    }
}


