//: [Previous](@previous)
import Foundation
/*:
 # 3. Control flow
 */
/*:
 ## 3.1 For-in loop
 */
let names = ["Anna, Rita, Mariya, Oksana"]
for name in names {
    print("hello, \(name)")
}

let dict = ["key1": 3, "key2": 6, "key3": 12]
for (key, value) in dict {
    print("for \(key) value is: \(value)")
}

for index in 1...10 {
    print(index)
}

let days = 30
let dayInterval = 3
for day in stride(from: 15, through: days, by: dayInterval) {
    print(day)
}
/*:
 ## 3.2 While loops
 */
var emptyArray = [Int](repeating: 0, count: 5)
var index = 0
while index < 5 {
    emptyArray[index] = index
    index += 1
}
print(emptyArray)
print(index)
/*:
 ## 3.2 Repeat-While
 */
index = 0
repeat {
    print(emptyArray[index])
    emptyArray[index] = index
    index += 1
} while index < 5
/*:
 ## 3.3 If, else, else if
 */
let temperature = 24
if temperature > 30 {
    print("it's warm")
} else if temperature < 0 {
    print("it's cold")
} else {
    print("it's comfort temperature")
}
/*:
 ## 3.4 Switch
 */
let someChar: Character = "a"
switch someChar {
case "a", "A":
    print("this is A")
default:
    print("not A")
}

let years = 30

switch years {
case 0..<18:
    print("child")
case 18..<65:
    print("middle years")
case 65..<120:
    print("old")
default:
    print("yeard can't be less than 0")
}

let point = (3, 1)
switch point {
case (let x,0):
    print("on x axis with value: \(x)")
case (0, let y):
    print("on y axis with value: \(y)")
case let (x,y):
    print("coordinates: \(x),\(y)")
}
/*:
 ### 3.4.1 Fallthrough
 */
let someInt = 5
var description = "The number is: "
switch someInt {
case 2, 3, 5, 7, 11, 13:
    description += "prime and "
    fallthrough
default:
    description += "integer"
}
/*:
 ### 3.4.2 Continue, break
 */
for i in 1...10 {
    if i == 4 {
        continue
    }
    else if i == 8 {
        break
    }
    print("i = \(i)")
}
print("The end")
//: [Next](@next)
