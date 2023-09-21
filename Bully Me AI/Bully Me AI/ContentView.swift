//
//  ContentView.swift
//  Bully Me AI
//
//  Created by Turker Kizilcik on 21.08.2023.
//



//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


import SwiftUI
import Foundation

struct ContentView: View {
    @State public var userInput: String = ""

    var body: some View {
        VStack {
            Text("Metin Girişi Örneği")
            TextField("Metin girin", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Text("Girilen Metin: \(userInput)")
            
            Button("API'yi Çağır") {
                // Kullanıcının girdiği metni `callOpenAI` fonksiyonuna gönderin.
                callOpenAI(prompt: "hi")
            }
        }
        .padding()
    }
}

func callOpenAI(prompt: String) {
    let apiKey = "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"
    let url = URL(string: "https://api.openai.com/v1/engines/davinci/completions")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type") // Content-Type'ı application/json olarak ayarlayın

    let parameters: [String: Any] = [
        "prompt": "Act as David Goggins. I can only be motivated via really harsh words. You motivate me for my own good. You keep it really short. Seperate your message into two sections. 1- Title, 2- Main thing. Main thing should be at most 2 sentences. When i say : '\(prompt)' you will motivate me. ",
        "max_tokens": 50
    ]

    request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error)")
            return
        }

        if let data = data {
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print("Response JSON: \(json)")
                    // Burada OpenAI API yanıtını işleyebilirsiniz.
                }
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
    }

    task.resume()
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

