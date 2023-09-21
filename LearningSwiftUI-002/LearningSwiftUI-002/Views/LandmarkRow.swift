//
//  LandmarkRow.swift
//  LearningSwiftUI-002
//
//  Created by Turker Kizilcik on 18.08.2023.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark : Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

