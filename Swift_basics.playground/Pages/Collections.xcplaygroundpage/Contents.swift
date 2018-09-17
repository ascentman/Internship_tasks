//: [Previous](@previous)
import Foundation
/*:
 # 2. Collections
 */
/*:
 ## 2.1 Array
 */
let starks: [String] = ["Eddard", "Catelyn", "Robb", "Sansa"]
print(starks[0])
print(starks[2])
print(starks.first!) // optional
print("Array count: \(starks.count)")

let someArray = [11, "someString", true, 444.4] as [Any]
for element in someArray {
    print(element)
}
/*:
 ## 2.2 Dictionary
 */
let ages = ["Robb": 15, "Sansa": 12, "Arya": 10, "Jon": 15]
print(ages.keys)
print(ages.values)
print(ages["Robb"]!) // optional

if let aryasAge = ages["Arya"] {
    print("Arya is \(aryasAge) years old")
}

let families = [
    "Stark": ["Robb": 15, "Sansa": 12, "Arya": 10, "Jon": 15],
    "Baratheon": ["Joffrey": 13, "Tommen": 8]
]
print(families["Stark"]!["Jon"]!) // optional
/*:
 ## 2.3 Set
 */
var colors: Set<String> = ["Blue", "Red", "Orange", "Blue"]
print(colors)
colors.remove("Red")
print(colors)
colors.insert("Black")
colors.insert("Black")
print(colors)
//: [Next](@next)
