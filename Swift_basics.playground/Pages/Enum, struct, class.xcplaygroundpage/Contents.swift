//: [Previous](@previous)
import Foundation
/*:
 ## 5.1 Enumerations
 */
enum CompassPoint {
    case north
    case south
    case east
    case west
}
var direction1 = CompassPoint.west
var direction2: CompassPoint = .east

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
let planet = Planet.mars.rawValue
/*:
 ## 5.2 Structures
 */
struct studentMark {
    private var mark = 90
    
    func printMark() {
        print("First mark is: \(mark)")
    }
    mutating func clearMark() {
        self.mark = 0
    }
}
var somemark = studentMark()
somemark.printMark()
somemark.clearMark()
/*:
 ## 5.3 Classes
 */
class Car {
    let year: Int // public
    var name: String // public
    var airCondition: Bool?
    private let maxSpeed = 200 //private
    
    func aboutCar() {
        print("This is a car with name: \(name) and year of production: \(year) and max speed: \(maxSpeed)")
    }
    
    init(name: String, year: Int, aircond: Bool?) {
        self.name = name
        self.year = year
        self.airCondition = aircond
    }
    
    convenience init(name: String) {
        self.init(name: name, year: 2018, aircond: true)
    }
}
let car1 = Car(name: "tesla")
print(car1.name, car1.year)
if let airconition = car1.airCondition {
    print(airconition)
}
car1.aboutCar()
let car2 = Car(name: "mazda", year: 1997, aircond: false)
print(car2.name, car2.year)
car2.aboutCar()
//: [Next](@next)
