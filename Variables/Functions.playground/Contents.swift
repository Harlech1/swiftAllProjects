import UIKit

func myFunction() {
    print("my function")
}

myFunction()

func sumFunction(x: Int, y: Int) -> Int  {
    return x+y
     
}

print(sumFunction(x: 10, y: 20))

func logicFunction(a: Int , b:Int) -> String {
    if a>b {
        return "Greater"
    } else {
        return "Less"
    }
}

logicFunction(a: -10, b: 0)
