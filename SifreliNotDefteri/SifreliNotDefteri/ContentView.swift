//
//  ContentView.swift
//  SifreliNotDefteri
//
//  Created by Turker Kizilcik on 13.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var password = ""
    var body: some View {
        VStack {
            VStack {
                Text("Welcome")
                //Image(systemName: "lock.fill")
                 //   .resizable()
                 //   .frame(width: 64.0, height: 64.0)
                 //   .font(.largeTitle)
                    
            }
            TextField("Password", text: $password)
                .cornerRadius(12)
                .font(.body)
                .foregroundColor(.blue)
            Button {
                
            } label: {
                
            }

        }
        .padding()
    }
}

























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
