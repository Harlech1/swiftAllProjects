//
//  DetailsView.swift
//  FavoriteBook
//
//  Created by Turker Kizilcik on 10.08.2023.
//

import SwiftUI

struct DetailsView: View {
    
    var chosenFavoriteElement : FavoriteElements
    
    var body: some View {
        VStack {
            Image(chosenFavoriteElement.imagename)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(chosenFavoriteElement.name)
                .font(.largeTitle)
                .padding()
            Text(chosenFavoriteElement.description)
        }
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(chosenFavoriteElement: thedarkknight)
    }
}
