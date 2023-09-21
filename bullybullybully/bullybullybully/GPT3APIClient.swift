//
//  GPT3APIClient.swift
//  bullybullybully
//
//  Created by Turker Kizilcik on 12.09.2023.
//

import Foundation
import OpenAI

class GPT3APIClient {

    static let shared = GPT3APIClient()

    private let apiKey: String

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    func generateText(prompt: String, maxTokens: Int) -> String {
        let request = GenerateRequest(prompt: prompt, maxTokens: maxTokens)
        let response = try? APIClient(apiKey: apiKey).generate(request)
        return response?.text ?? ""
    }

}

