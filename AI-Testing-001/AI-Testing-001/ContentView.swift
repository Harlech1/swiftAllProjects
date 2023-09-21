//
//  ContentView.swift
//  AI-Testing-001
//
//  Created by Turker Kizilcik on 24.08.2023.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @State var text = ""
    @State var returnedText = ""

    let engineId = "text-davinci-002"

    var body: some View {
        VStack {
            TextField("Enter text", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                self.fetchResponse()
            }) {
                Text("Send")
            }
            
            Text(returnedText)
        }
    }

    func fetchResponse() {
        let headers: HTTPHeaders = [
            .authorization(bearerToken: "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"),
            .accept("application/json")
        ]
        let parameters: [String: Any] = [
            "model": engineId,
            "prompt": text,
            "max_tokens": 60
        ]

        AF.request("https://api.openai.com/v1/engines/\(engineId)/completions",
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: OpenAIResponse.self) { response in
                switch response.result {
                case .success(let openAiResponse):
                    DispatchQueue.main.async {
                        if let firstChoice = openAiResponse.choices.first {
                            self.returnedText = firstChoice.text
                        }
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            }
    }
}

struct OpenAIResponse: Codable {
    struct Choice: Codable {
        let text: String
    }
    let choices: [Choice]
}
