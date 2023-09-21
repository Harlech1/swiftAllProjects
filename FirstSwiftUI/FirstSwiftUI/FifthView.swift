//
//  FifthView.swift
//  FirstSwiftUI
//
//  Created by Turker Kizilcik on 10.08.2023.
//

import SwiftUI

struct FifthView: View {
    
    @State var myName = "Türker"
    
    var body: some View {
        VStack {
            Text(myName)
                .padding()

            TextField("placeholder", text: $myName)
        }
        
    }
}

struct FifthView_Previews: PreviewProvider {
    static var previews: some View {
        FifthView()
    }
}
