import Foundation

/**
 SOLID - design principles intended to make software designs more understandable, flexible and maintainable.
 
 
 1. The Single Responsibility Principle: a class should have only a single responsibility.
 
 2. Open-closed principle: Software entities (classes, modules, functions, etc.) should be open for extension, but closed for modification.
 
 3. Liskov substitution principle: functions that use pointers or references to base classes must be able to use objects of derived classes without knowing it (new derived classes are extending the base class without changing their behaviour.)
 
 4. Interface segregation principle: clients should not be forced to depend upon interfaces that they do not use.
 
 5. Dependency inversion principle: a) high level modules should not depend upon low level modules. both should depend upon abstractions. b) Abstractions should not depend upon details. details should depend upon abstractions.
 
 */

// 1. The Single Responsibility Principle (SRP)
// Problem: in existing class change method of converting report from PDF to DOC


class ReportGenerator {
    var name: String?
    var date: Date?
    
    func createReport() {
        print("this function creates report from a template")
    }
    
    func convertReport() {
        print("this function converts prepared report to PDF")
    }
    
    func sendReport() {
        print("this function sends converted report via network")
    }
}

// Solution: separate ReportGenerator on small pieces based on functionality for easy change only specific part and not the whole ReportGenerator class. Also we can test every class separately.

class ReportCreator {
    var name: String?
    var date: Date?
    
    func createReport(from template: String) {
        print("this class only creates report from \(template)")
    }
}

class ReportConverter {
    var input: ReportCreator?
    var format: String?
    
    func convert(report: ReportCreator, toFormat: String) {
        print("this class responsible only for converting report to specific format")
    }
}

class ReportSender {
    var report: ReportConverter?
    var destination: String?
    
    func send(report: ReportConverter, toDestiantion: String) {
        print("this class only responsible for sending report via network")
    }
}



// 2. Open-closed principle (OCP)
// Problem: Lets say we have class Logger which shows details about cars on a crossroad. And it works fine but then we should add also logging of bikes which except adding of a new class coused changes in our Logger class. That's violation on Open-Close principle.

final class Logger {
    private var inputData: [Car] = []
    func add(_ obj: Car) {
        inputData.append(obj)
    }
    func showReport() {
        print(inputData.count, "was logged in. Report date: \(Date())")
    }
}


final class Car {
    private let model: String
    init(model: String) {
        self.model = model
    }
    func logging() -> String {
        return "A new Car: \(model) logged"
    }
}

let logger = Logger()
let car11 = Car(model: "Tesla")
let car12 = Car(model: "Audi")

car11.logging()
car12.logging()

logger.add(car11)
logger.add(car12)
logger.showReport()


// Solution: create protocol which will be implemented by classes: Car2 (I create a new one) and Bike

protocol Printable {
    func logging() -> String
}

final class Logger2 {
    var inputData: [Printable] = []
    func add(_ obj: Printable) {
        inputData.append(obj)
    }
    func showReport() {
        print(inputData.count, "was logged in. Report date: \(Date())")
    }
}

final class Car2: Printable {
    let model: String
    init(model: String) {
        self.model = model
    }
    
    func logging() -> String {
        return "A new Car: \(model) logged"
    }
}

final class Bike: Printable {
    let type: String
    init(type: String) {
        self.type = type
    }
    
    func logging() -> String {
        return "A new Bike: \(type) logged"
    }
}

let logger2 = Logger2()
let car1 = Car2(model: "Tesla")
let bike1 = Bike(type: "Honda")
let car2 = Car2(model: "Audi")
let bike2 = Bike(type: "Yamaha")

car1.logging()
car2.logging()
bike1.logging()
bike2.logging()

logger2.add(car1)
logger2.add(car2)
logger2.add(bike1)
logger2.add(bike2)
logger2.showReport()



// 3. Liskov substitution principle (LSP)

class Rectangle {
    var width: Float?
    var height: Float?
    
    func setWidth(width: Float) {
        self.width = width
    }

    func setHeight(height: Float) {
        self.height = height
    }
    
    func calculateSquare() -> Float {
        return width! * height!
    }
}

let rectangle = Rectangle()
rectangle.setHeight(height: 4.0)
rectangle.setWidth(width: 5.0)
rectangle.calculateSquare()

class Square: Rectangle {
    
    override func setWidth(width: Float) {
        //assert(height == width, "error")
        self.width = width
    }
    
    override func setHeight(height: Float) {
//        assert(width == height, "error")
        self.height = height
    }
    
    override func calculateSquare() -> Float {
        return pow(width!, 2)
    }
}

let square = Square()
square.setWidth(width: 4.0)
//square.setHeight(height: 5.0) - LSP violation: derived class shouldnt introduce new exceptions
square.calculateSquare()

// LSP says that we can substitute object of derived class in a base class and result of using base class methods should not be changed. Lets try...

let rectangle2: Rectangle = Square()

rectangle2.setHeight(height: 5.0)
rectangle2.setWidth(width: 4.0)

// we have got not correct square :(
// assert(rectangle2.width! * rectangle2.height! == rectangle2.calculateSquare(), "something went wrong")

// Solution: not use inheritance in this case. Instea create a protocol which calculates square for both shapes and apply it to Rectangle2 and Square2 classes

protocol CalculatorProtocol {
    func calculateSquareOfShape() -> Float
}

class Rectangle2: CalculatorProtocol {
    
    var width: Float?
    var height: Float?
    
    func setWidth(width: Float) {
        self.width = width
    }
    
    func setHeight(height: Float) {
        self.height = height
    }
    
    func calculateSquareOfShape() -> Float {
        return width! * height! // force unwrap here only to show a main idea using less coding
    }
}

class Square2: CalculatorProtocol {
    
    var width: Float?
    
    func setWidth(width: Float) {
        self.width = width
    }
    
    func calculateSquareOfShape() -> Float {
        return pow(width!, 2) // force unwrap here only to show a main idea using less coding
    }
}

let rect = Rectangle2()
rect.setHeight(height: 4.0)
rect.setWidth(width: 5.0)
rect.calculateSquareOfShape()

let square2 = Square2()
square2.setWidth(width: 5.0)
square2.calculateSquareOfShape()


// 4. The Interface Segregation Principle (ISP)
// ISP says that we should avoid "fat" interfaces which has too many members/methods which are not cohesive and contain more information than we need.

protocol GestureProtocol {
    func didTap()
    func didDoubleTap()
    func didLongPress()
}

class SuperButton: GestureProtocol {
    func didTap() {
        // send tap action
    }
    
    func didDoubleTap() {
        // send double tap action
    }
    
    func didLongPress() {
        // send long press action
    }
}

// Problem: SuperButton worls fine but we also want to add SimpleButton which conforms to GestureProtocol and should realize only didTap()

class PoorButton: GestureProtocol {
    func didTap() {
        // send tap action
    }
    
    func didDoubleTap() { } // :((
    func didLongPress() { } // :((
}

// Soluton: using small protocols

protocol TapProtocol {
    func didTap()
}

protocol DoubleTapProtocol {
    func didDoubleTap()
}

protocol LongPressProtocol {
    func didLongPress()
}

class SuperButton2: TapProtocol, DoubleTapProtocol, LongPressProtocol {
    func didTap() {
        // send tap action
    }
    
    func didDoubleTap() {
        // send double tap action
    }
    
    func didLongPress() {
        // send long press action
    }
}

class PoorButton2: TapProtocol {
    func didTap() {
        // send tap action
    }
}


// ISP also applies to "fat" classes

protocol Playable {
    var url: String { get }
}

class Video: Playable {
    var title: String = "My Video"
    var description: String = "This is a beautiful video"
    var author: String = "Marco Santarossa"
    var url: String = "https://video.com"
    var duration: Int = 60
    var created: Date = Date()
    var update: Date = Date()
}

// in a client function we need only URL and not all proterties of Video class. So protocol Playable helps us to avoid fat class

func play(video: Playable) {
    // load the player with url
}


// 5. Dependency inversion principle (DIP)

class Handler {
    
    let fileManager = FilesystemManager() // tightly coupled with FilesystemManager. Can't be reusable:((
    
    func handle(string: String) {
        fileManager.save(string: string)
    }
}

// FilesystemManager is easy to reuse:

class FilesystemManager {
    
    func save(string: String) {
        // Open
        // Save
        // Close
    }
}

// Solution: Using abstract layers - we can implement protocol Storage and Handler now becomes independent of kind of storage (Filesystem, Cloud, Database etc)

protocol Storage {
    
    func save(string: String)
}

class Handler2 {
    
    let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    func handle(string: String) {
        storage.save(string: string)
    }
}

class FilesystemManager2: Storage {
    
    func save(string: String) {
        // Open
        // Save
        // Close
    }
}

class DatabaseManager: Storage {
    
    func save(string: String) {
        // Connect
        // Save
        // Close
    }
}

// P.S. my own understanding of SOLID principles with examples
