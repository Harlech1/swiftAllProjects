//
//  ContentView.swift
//  bullyme
//
//  Created by Turker Kizilcik on 1.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text = ""
    
    var body: some View {
        VStack {
            Text("Yapmak istediğiniz bir şeyi yazınız.")
            TextEditor(text: $text)
                            .padding()
                            .border(Color.black, width: 1)
                            .cornerRadius(5)
                            .frame(height: 100) // İstenilen yüksekliği ayarlayabilirsiniz
                }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
