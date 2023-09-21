//
//  main.swift
//  ProtocolSwift
//
//  Created by Turker Kizilcik on 9.08.2023.
//

import Foundation


protocol Running {
    func myRun()
}

class Animal {
    
    func test() {
        print("test")
    }
}

class Dog : Running {
    func myRun() {
        print("running")
    }
}

class Cat : Animal , Running{
    func myRun() {
        
    }
}

class Turtle : Animal {
    
}

struct Bird : Running {
    func myRun() {
        print("myrun")
    }
    
    
}

let tweety = Bird()
tweety.myRun()


let barley = Dog()
barley.myRun()

let cat = Cat()
//cat.running()

let leonardo = Turtle()
//leonardo.running()

