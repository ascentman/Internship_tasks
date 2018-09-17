//: [Previous](@previous)
import Foundation
/*:
 ## 6.1 Properties
 */
class Configuration {
    let settings = "setting.txt" //import data from external resource
}

class Robot {
    //stored properties
    let legs: Int = 2
    var hands: Int
    private var name: String
    // static property
    static var highestUnlockedLevel = 1
    // lazy property: not initialized when new instance of Robot created
    lazy var showConfig = Configuration()
    //Subscript
    private var robotNature = ["planet": "mars", "country": "New Horizonts", "city": "New World"]
    subscript(key: String) -> String? {
        get {
            return robotNature[key]
        }
    }
    // computed property
    var robotName: String {
        set {
            name = newValue
        }
        get {
            return name + "robot"
        }
    }
    // read-only property: only get realized
    var producer: String {
        get {
            return "myCompany"
        }
    }
    // property observers
    var steps: Int = 0 {
        willSet(updateSteps) {
            print("about to set new steps value: \(updateSteps)")
        }
        didSet {
            if steps > oldValue {
                print("Robot did \(steps-oldValue) steps!")
            }
        }
    }
    
    init(name: String, hands: Int) {
        self.name = name
        self.hands = hands
    }
    
    // instance method
    func incrementHandsOn(_ hand: Int) {
        hands += hand
    }
    // type method
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
}

let someRobot = Robot(name: "Yo", hands: 4)
someRobot.robotName
someRobot.producer
someRobot.steps
someRobot.steps = 5
/*:
 ## 6.2 Static and Class properties
 */
class SomeClass {
    // static
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    // for computed properties: use class to allow subclasses override superclass implementation
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
var someVar = SomeClass.storedTypeProperty
/*:
 ## 6.3 Modifying Value Types from Within Instance Methods
 */
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
/*:
 ## 6.4 Subscript
 */
someRobot["planet"]
someRobot["city"]
/*:
 ## 6.5 Inheritance
 */
class DisplayRobot: Robot {
    private let power: Int
    func show() -> String {
        return self.robotName
    }
    init(power: Int) {
        self.power = power
        super.init(name: "Bobo", hands: 3)
        print("Robot inited with power: \(power)")
    }
}
let rob = DisplayRobot(power: 100)
rob.show()
/*:
 ## 6.6 Overriding
 */
class DisplayRobotOnScreen : DisplayRobot {
    override func show() -> String {
        return self.robotName + " on screen!"
    }
}
let rob2 = DisplayRobotOnScreen(power: 200)
rob2.show()
//: [Next](@next)
