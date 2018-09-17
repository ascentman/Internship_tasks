//: [Previous](@previous)
import Foundation
/*:
 # 4. Functions
 */
/*:
 ## 4.1 Function without parameter
 */
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
/*:
 ## 4.2 Function with multiple parameters
 */
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return "how are u?"
    } else {
        return "hello, \(person)"
    }
}
print(greet(person: "Tim", alreadyGreeted: false))
/*:
 ## 4.3 Function with multiple return values
 */
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
/*:
 ## 4.4 Function with optional return values
 */
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
/*:
 ## 4.5 Function with default values
 */
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    print(parameterWithoutDefault, parameterWithDefault)
}
someFunction(parameterWithoutDefault: 4)
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
/*:
 ## 4.6 Variadic Parameters
 */
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
/*:
 ## 4.6 In-Out Parameters
 */
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
/*:
 ## 4.6 Function Types
 */
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")
/*:
 ## 4.7 Closures
 */
let sum = {
    (n1: Int, n2: Int) -> Int in
    return n1 + n2
}
let digits = sum(10, 20)
print(digits)

var count:[Int] = [5, 10, -6, 75, 20]
let ascending = count.sorted(by: { n1, n2 in n1 < n2 })

var shorthand: (String, String) -> String
shorthand = { $1 }
print(shorthand("Ukraine", "UA"))
//: [Next](@next)
