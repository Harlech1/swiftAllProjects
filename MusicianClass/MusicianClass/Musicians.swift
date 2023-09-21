//
//  Musicians.swift
//  MusicianClass
//
//  Created by Nikolay Melzack on 31.07.2023.
//

import Foundation

enum MusicianType {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
    case Violinist
}

class Musicians {
    
    /*
    var name = ""
    var age = 0
    var instrument = ""
     */
    
    var name : String
    var age : Int
    var instrument : String
    var type : MusicianType
    
    
//    constructor / initalizer
    init(nameInit: String, ageInit: Int, instrumentInit: String, typeInit: MusicianType) {
        
        name = nameInit
        age = ageInit
        instrument = instrumentInit
        type = typeInit
        
        print("musician created")
    }
    
    func sing() {
        print("nothing else matters")
    }
}
