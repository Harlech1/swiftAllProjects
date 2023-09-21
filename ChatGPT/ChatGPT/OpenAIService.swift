//
//  OpenAIService.swift
//  ChatGPT
//
//  Created by Turker Kizilcik on 9.09.2023.
//

import Foundation
import Alamofire

class OpenAIService {
    
    let baseUrl = "https://api.openai.com/v1/chat/"
    
    func sendMessage(message: String) {
        let body = OpenAICompletionsBody(model: "gpt-3.5-turbo", prompt: message, temperature: 0.7)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Constants.openAIAPIKey)"
        ]
        
        AF.request(baseUrl + "completions", method: .post, parameters: body, encoder: .json, headers: headers).responseString { data in
            print(data.result)
        }
    }
}

struct OpenAICompletionsBody: Encodable {
    let model: String
    let prompt: String
    let temperature: Float?
}
