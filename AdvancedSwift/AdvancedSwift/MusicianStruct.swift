//
//  MusicianStruct.swift
//  AdvancedSwift
//
//  Created by Turker Kizilcik on 9.08.2023.
//

import Foundation

struct MusicianStruct {
    
    var name : String
    var age : Int
    var instrument : String
    
    //inite gerek yok
    
    mutating func happyBirthday() {
        self.age += 1
    }
}
