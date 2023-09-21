//
//  bullymeplsApp.swift
//  bullymepls
//
//  Created by Turker Kizilcik on 9.09.2023.
//

import SwiftUI

@main
struct bullymeplsApp: App {
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
