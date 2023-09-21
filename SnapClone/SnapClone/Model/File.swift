//
//  File.swift
//  SnapClone
//
//  Created by Turker Kizilcik on 10.08.2023.
//

import Foundation

class UserSingleton {
    
    static let sharedUserInfo = UserSingleton()
    
    var email = ""
    var username = ""
    
    private init() {
        
    }
    
    
}
