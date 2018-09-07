//: [Previous](@previous)
/*:
## 1. First program
*/
import Foundation
print("Hello, world!")
/*:
## 2. Constants and Variables
*/
let maxAttempts = 5
//maxAttempts = 6 // Error

var someprice = 100
someprice = 130

/*:
## 3. Int, Float, Type annotation
*/
let minUintValue = UInt8.min
let maxUintValue = UInt8.max
let minIntValue = Int.min
let maxIntValue = Int.max

let someFloat = 41.455
type(of: someFloat) // Double

let anotherFloat: Float = 32.554
type(of: anotherFloat) //Float

/*:
 ## 4. Booleans
 */
var isDoorOpen = true

if isDoorOpen {
    print("Door is opened")
} else {
    print("Door is closed")
}

/*:
 ## 5. Typealias
 */
typealias myType = Int
let myVar: myType = 8
print(myVar)

/*:
 ## 6. Tuples
 */
let error404: (code: Int, value: String) = (404, "not found")
print(error404.code, error404.value)
let (codeOnly, _) = error404
print(error404.0)

/*:
 ## 7. Optionals
 */
var serverResponseCode: Int? = 404
serverResponseCode = nil
/*:
 ### 7.1 Force unwrapping
 */
let ageString = "20"
let ageInt = Int(ageString)

print(ageInt!) // dangerous!
/*:
 ### 7.2 Optional binding
 */
if let ageInt = ageInt {
    print(ageInt)
}
/*:
 ### 7.3 Implicit unwrapping
 */
var age: Int! = 20
if age != nil {
    print(age)
}
/*:
 ### 7.4 ??
 */
var someAge: Int? = 20
let ageNum = someAge ?? 0
print(ageNum)

/*:
 ## 8. Assert
 */
let errorAge = -3
assert(age >= 0, "Age less than 0 ;(")

//: [Next](@next)
