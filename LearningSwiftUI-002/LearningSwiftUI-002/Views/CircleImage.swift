//
//  CircleImage.swift
//  LearningSwiftUI-002
//
//  Created by Turker Kizilcik on 18.08.2023.
//

import SwiftUI

struct CircleImage: View {
    
    var image : Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
