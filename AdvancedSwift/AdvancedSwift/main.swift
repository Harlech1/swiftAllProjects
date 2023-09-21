//
//  main.swift
//  AdvancedSwift
//
//  Created by Turker Kizilcik on 9.08.2023.
//

import Foundation

let classJames = MusicianClass(nameInput: "James", ageInput: 55, instrumentInput: "Guitar")



var structJames = MusicianStruct(name: "James", age: 55, instrument: "Guitar")



//print(classJames.age)
classJames.happyBirthday()
//print(classJames.age)

//print(structJames.age)
structJames.happyBirthday()
//print(structJames.age)

/*
let myTuple = (1,3)
print(myTuple.0)
let myTuple2 = (1,3,5)

// when tuple is let its immutable. it can be mutable when its set to var.
print(myTuple2.2)

let myTuple3 = ("Türker", 1)
print(myTuple.0)

let myTuple4 = (10,[5,20,30])
print(myTuple4.1[1])

let predefinedTuple : (String, String)
predefinedTuple.0 = "tür"
predefinedTuple.1 = "ker"
print(predefinedTuple)

let newTuple = (name: "James", metallica: true)
print(newTuple.metallica)
print(newTuple.name)
 */

/*
let myNumber = "5"

func convertToIntegerGuard (stringInput : String) -> Int {
    guard let myInteger = Int(stringInput) else {
        return 0
    }
    return myInteger
}

func convertToIntegerIf (stringInput : String) -> Int {
    if let myInteger = Int(stringInput) {
        return myInteger
    } else {
        return 0
    }
}
 */

let myNum = 11

let myRemainder = myNum % 7

//print(myRemainder)
/*
if myRemainder == 1 {
    print("its 1")
} else if myRemainder == 2 {
    print("its 2")
} else if myRemainder == 3 {
    print("its 3")
}
 */

/*
switch myRemainder {
case 1...5:
    print("its 1-5")
default:
    print("none of the above")
}
 */

var x = 5

x += 1

print(x)












//print(classJames.age)
//print (structJames.age)
// ref vs value
//let copyOfClassJames = classJames
//var copyOfStructJames = structJames
//print(copyOfClassJames.age)
//print(copyOfStructJames.age)
//copyOfClassJames.age = 52
//copyOfStructJames.age = 52
//print(copyOfClassJames.age)
//print(copyOfStructJames.age)
//print(classJames.age)
//print(structJames.age)
// ref types --> class
// copy --> same object new reference -> 1 objecrt + 2 references

// value types --> struct
// copy -> new object --> 2 objects

