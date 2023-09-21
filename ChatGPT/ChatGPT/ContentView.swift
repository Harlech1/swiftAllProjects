//
//  ContentView.swift
//  ChatGPT
//
//  Created by Turker Kizilcik on 9.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var chatMessages: [ChatMessage] = ChatMessage.sampleMessages
    @State var messageText : String = ""
    let openAIService = OpenAIService()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(chatMessages, id: \.id) { message in
                        messageView(message: message)
                    }
                }
            }
            HStack {
                TextField("Enter a message", text: $messageText) {
                    
                }
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(12)
                Button {
                    sendMessage()
                } label: {
                    Text("Send")
                        .foregroundColor(.white)
                        .padding()
                        .background(.black)
                        .cornerRadius(12)
                }
            }
        }
        .padding()
        .onAppear{
            openAIService.sendMessage(message: "Generate a tagline for an ice cream shop")
        }
    }
    
    func messageView(message: ChatMessage) -> some View {
        HStack {
            if message.sender == .me { Spacer() }
            Text(message.content)
                .foregroundColor(message.sender == . me ? .white : .black)
                .padding()
                .background(message.sender == .me ? .blue : .gray.opacity(0.1))
                .cornerRadius(16)
            if message.sender == .gpt { Spacer() }
        }
    }
    
    func sendMessage() {
        messageText = ""
        print(messageText)
    }
}

struct ChatMessage {
    let id : String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
}

enum MessageSender {
    case me
    case gpt
}

extension ChatMessage {
    static let sampleMessages = [
        ChatMessage(id: UUID().uuidString, content: "Sample Message From Me", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Sample Message From Gpt", dateCreated: Date(), sender: .gpt),
        ChatMessage(id: UUID().uuidString, content: "Sample Message From Me", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Sample Message From Gpt", dateCreated: Date(), sender: .gpt)
    ]
}


















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
