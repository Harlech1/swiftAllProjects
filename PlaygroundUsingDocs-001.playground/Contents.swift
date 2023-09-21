import UIKit

var x = 0.0

var welcomeMessage: String

welcomeMessage = "Hello"

print(welcomeMessage)

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"


// terminator adds \n by default.
print(welcomeMessage, x,  terminator: "\n")
print(welcomeMessage, x)

let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8

//signed integer (-x, x).. unsigned integer (0, 2x)

//double 64bit, float 32bit number
// double precision: 15 decimal, float precision: 6 decimal


let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

/*For decimal numbers with an exponent of x, the base number is multiplied by 10ˣ:
 1.25e2 means 1.25 x 10², or 125.0.
 1.25e-2 means 1.25 x 10⁻², or 0.0125.
 For hexadecimal numbers with an exponent of x, the base number is multiplied by 2ˣ:
 0xFp2 means 15 x 2², or 60.0.
 0xFp-2 means 15 x 2⁻², or 3.75.
 All of these floating-point literals have a decimal value of 12.1875:
 */

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//let cannotBeNegative: UInt8 = -1
// UInt8 can't store negative numbers, and so this will report an error
//let tooBig: Int8 = Int8.max + 1
// Int8 can't store a number larger than its maximum value,
// and so this will also report an error

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound is now 0

//Tuples group multiple values into a single compound value. The values within a tuple can be of any type and don’t have to be of the same type as each other.

let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// Prints "The status code is 404"

print("The status code is \(http404Error.0)")
// Prints "The status code is 404"
print("The status message is \(http404Error.1)")
// Prints "The status message is Not Found"

let http200Status = (statusCode: 200, description: "OK")
http200Status.statusCode

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int"

var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value

var surveyAnswer: String?
// surveyAnswer is automatically set to nil

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
// Prints "convertedNumber contains some integer value."

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// Prints "convertedNumber has an integer value of 123."

if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}
// Prints "The string "123" has an integer value of 123"

let myNumber = Int(possibleNumber)
// Here, myNumber is an optional integer
if let myNumber1 = myNumber {
    // Here, myNumber is a non-optional integer
    print("My number is \(myNumber1)")
}
// Prints "My number is 123"

if let myNumber {
    print("My number is \(myNumber)")
}

if let firstNumber = Int("4"),
   let secondNumber = Int("42"),
   firstNumber < secondNumber &&
   secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"


if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// Prints "4 < 42 < 100"

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation point


let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation point

let optionalString = assumedString
// The type of optionalString is "String?" and assumedString isn't force-unwrapped.,

func canThrowAnError() throws {
    // this function may or may not throw an error
}

do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}


func makeASandwich() throws {
    // ...
}

/*
do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}
*/

let age = -3
//assert(age >= 0, "A person's age can't be less than zero.")

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    //assertionFailure("A person's age can't be less than zero.")
}

//precondition(index > 0, "Index must be greater than zero.")

