//
//  LandmarkRow.swift
//  MVVM-SwiftUI
//
//  Created by Nivedha Rajendran on 04.10.24.
//


import SwiftUI

struct LandmarkRow: View {
    
    let landmark: Landmark
    
    var body: some View {
        
        HStack {
            let imageLength: Double = 50
            landmark.image
                .resizable()
                .frame(width: imageLength, height: imageLength)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct AppetizerCell_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: LandmarksMockData().landmarks[0])
    }
}