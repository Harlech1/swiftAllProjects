//
//  FourthView.swift
//  FirstSwiftUI
//
//  Created by Turker Kizilcik on 10.08.2023.
//

import SwiftUI

struct FourthView: View {
    
    @State var myName = "Türker"
    
    var body: some View {
        VStack {
            Text(myName)
            Button(action: {
                self.myName = "James"
            }) {
                Text("MyButton")
            }
                
            

        }
        
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}
