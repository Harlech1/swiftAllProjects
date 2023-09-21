//
//  ContentView.swift
//  bullymepls
//
//  Created by Turker Kizilcik on 9.09.2023.
//

import SwiftUI
import Foundation
import UserNotifications

struct ContentView: View {
    
    @State private var text = ""
    @State private var selectedTime = Date()
    @State private var apiResponse = ""
    
    var body: some View {
        VStack {
            Text("Write down what you want to do.")
            TextField("Enter", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            DatePicker("Bildirim Zamanı Seçin", selection: $selectedTime, displayedComponents: [.hourAndMinute])
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                            .padding()
            Button("API'yi Çağır") {
                let messages = [["role": "system", "content": "You are a helpful assistant."], ["role": "user", "content": "Hello gpt!"]]
                
                chatWithOpenAI(messages: messages) { response in
                    if let response = response {
                        apiResponse = response // API yanıtını @State değişkenine atayın
                        print(response)
                    } else {
                        apiResponse = "API'den yanıt alınamadı." // Hata durumu
                    }
                }
            }
            
        }
        .padding()
    }
    
    func scheduleNotification() {
            let content = UNMutableNotificationContent()
            content.title = "Yeni Notifikasyon"
            content.body = text

            let calendar = Calendar.current
            let dateComponents = calendar.dateComponents([.hour, .minute], from: selectedTime)
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Notifikasyon gönderme hatası: \(error.localizedDescription)")
                } else {
                    print("Notifikasyon başarıyla gönderildi.")
                }
            }
        }
    
    func chatWithOpenAI(messages: [[String: String]], completion: @escaping (String?) -> Void) {
        let apiKey = "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"
        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "messages": messages
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion(nil)
                return
            }

            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let choices = json["choices"] as? [[String: Any]] {
                            if let firstChoice = choices.first, let text = firstChoice["message"] as? String {
                                completion(text)
                            }
                        }
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                    completion(nil)
                }
            }
        }

        task.resume()
    }

}





























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
