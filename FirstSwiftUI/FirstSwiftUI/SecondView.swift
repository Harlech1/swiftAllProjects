//
//  SecondView.swift
//  FirstSwiftUI
//
//  Created by Turker Kizilcik on 10.08.2023.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        Image("slvt")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.8)    
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
