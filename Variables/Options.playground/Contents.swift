import UIKit

var myName : String?
// ? olabilir olmayabilir ---- ! kesinlikle var illa yap
myName?.uppercased()

var myString = "Lars"

//myString!.lowercased()

var myAge = "asd"

var myInteger = (Int(myAge) ?? 0)  * 5

if let myNumber = Int(myAge) {
    print(myNumber * 5 )
} else {
    print("wrong input")
}
