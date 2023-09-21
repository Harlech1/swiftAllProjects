//
//  ThirdView.swift
//  FirstSwiftUI
//
//  Created by Turker Kizilcik on 10.08.2023.
//

import SwiftUI

struct ThirdView: View {
    
    let myArray = ["James", "Lars", "Kirk", "Rob"]
    
    var body: some View {
        List {
            ForEach(myArray, id: \.self) { element in
                Text(element)
            }
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}


/*
 List (myArray , id: \.self) { element in
 HStack {
         Image("slvt")
             .resizable()
             .aspectRatio(contentMode: .fit)
             .frame(width: 30, height: 30)
         Text(element)
         }
}
 */
