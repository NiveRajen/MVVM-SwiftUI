//
//  LandmarkDetail.swift
//  MVVM-SwiftUI
//
//  Created by Nivedha Rajendran on 04.10.24.
//


import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var landmarksMockData: LandmarksMockData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        landmarksMockData.landmarks.firstIndex (where: {
            $0.id == landmark.id
        })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate).ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            let yOffset: CGFloat = -130
            CircleImage(image: Image(landmark.imageName))
                .offset(y: yOffset)
                .padding(.bottom, yOffset)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $landmarksMockData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
                
            }.padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    
    static let landmarksMockData = LandmarksMockData()
    
    static var previews: some View {
        LandmarkDetail(landmark: landmarksMockData.landmarks[0])
            .environmentObject(landmarksMockData)
    }
}
