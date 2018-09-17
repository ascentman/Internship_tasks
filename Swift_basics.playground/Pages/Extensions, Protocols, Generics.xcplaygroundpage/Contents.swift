//: [Previous](@previous)
import Foundation
/*:
 ## 7.1 Extensions
 */
extension Int {
    func plusOne() -> Int {
        return self + 1
    }
}
var myInt = 0
myInt.plusOne()

extension String {
    
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString)
    }
}
let newString = "the old bike".replace(target: "old", withString: "new")
print(newString)
/*:
 ## 7.2 Protocols
 */
protocol Flyable {
    var wings: Int { get set }
    func fly()
}

class Animal: Flyable {
    var name: String
    
    // protocol conformance: implement properties and methods of a protocol
    var wings: Int
    func fly() {
        print("now we can fly")
    }
    
    init(name: String, wings: Int) {
        self.name = name
        self.wings = 2
    }
}
/*:
 ## 7.3 Generics
 */
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

var var1: Int = 5
var var2: Int = 10
swapTwoValues(&var1, &var2)
print(var1, var2)

var var3: Double = 1.1
var var4: Double = 12.5
swapTwoValues(&var3, &var4)
print(var3, var4)

var var5: String = "Hello"
var var6: String = "World"
swapTwoValues(&var5, &var6)
print(var5, var6)
