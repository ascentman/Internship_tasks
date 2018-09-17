//: [Previous](@previous)
/*:
 ## 1. Basics
 */
/*:
## 1.1 First program
*/
import Foundation
print("Hello, world!")
/*:
## 1.2 Constants and Variables
*/
let maxAttempts = 5
//maxAttempts = 6 // Error

var someprice = 100
someprice = 130
/*:
## 1.3 Int, Float, Type annotation
*/
let personAge: Int = 26
let minUintValue = UInt8.min
let maxUintValue = UInt8.max
let minIntValue = Int.min
let maxIntValue = Int.max

let someFloat = 41.455
type(of: someFloat) // Double
let anotherFloat: Float = 32.554
type(of: anotherFloat) //Float
/*:
 ## 1.4 Booleans
 */
var isDoorOpen = true

if isDoorOpen {
    print("Door is opened")
} else {
    print("Door is closed")
}
/*:
 ## 1.5 Strings
 */
let name: String = "Mark"
let surname = "Smith"
let fullname = name + " " + surname
let sentence = "Person with name: \(name) and surname: \(surname)."
/*:
 ## 1.6 Typealias
 */
typealias myType = Int
let myVar: myType = 8
print(myVar)
/*:
 ## 1.7 Tuples
 */
let error404: (code: Int, value: String) = (404, "not found")
print(error404.code, error404.value)
let (codeOnly, _) = error404
print(error404.0)
/*:
 ## 1.8 Optionals
 */
var serverResponseCode: Int? = 404
serverResponseCode = nil
/*:
 ### 1.8.1 Force unwrapping
 */
let ageString = "20"
let ageInt = Int(ageString)

print(ageInt!) // dangerous!
/*:
 ### 1.8.2 Optional binding
 */
if let ageInt = ageInt {
    print(ageInt)
}
/*:
 ### 1.8.3 Implicit unwrapping
 */
var age: Int! = 20
if age != nil {
    print(age)
}
/*:
 ### 1.8.4 ?? (Nil-coalesting operator)
 */
var someAge: Int? = 20
let ageNum = someAge ?? 0
print(ageNum)
/*:
 ## 1.9. Assert
 */
let errorAge = -3
assert(age >= 0, "Age less than 0 ;(")
//: [Next](@next)
