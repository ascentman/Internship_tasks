import UIKit

/**
 OOP principles:
 
 - Encapsulation: classes normally hide details of implementation from the client. The client cares about offered functionality in a class, and not about how it's implemented (Data abstraction)
 
 - Inheritance: form of software reuse. Allow a new class absorb an existing members of a class. Derived class normally adds its own fields and methods.
 
 - Polymorphism: enables to write applications that process objects that share the same base class in a class hierarchy as if they were all objects of the Base class. If Rectangular is derived from Quariliteral then Rectangle is more specific version of Quariliteral and any operation on Quariliteral object can also be performed on a Rectangular object.
 
 - Composition: a class can have a references to objects of other clases as members. E.g: Cat object use Date object for date of birth
 */

class Food {
    
    let meal: [String]
    
    init(meal: [String]) {
        self.meal = meal
    }
}

// Base (root) class - also called an abstract class
class Animal {
    
    // Encapsulation - using internal property in a class
    let name: String
    
    init(with name: String) {
        self.name = name
    }
    
    // method in a class
    func sound() -> String {
        fatalError("implement this method for specific \(name)")
    }
    
    func feed(with meal: Food) -> String {
        fatalError("implement this method for specific \(name)")
    }
}

// Inheritance: Animal -> Cat, Animal -> Dog

class Cat: Animal {
    
    // Composition - creating reference on another Class object
    let dateOfBirth: Date
    
    init(name: String, dateOfBirth: Date) {
        self.dateOfBirth = dateOfBirth
        super.init(with: name)
    }
    
    override func sound() -> String {
        return "\(name) makes sound: 'meow-meow'"
    }
    
    override func feed(with meal: Food) -> String {
        if meal.meal.contains("Cheese") {
            return "I have eaten cheese"
        } else {
            return "I am hungry"
        }
    }
}


class Dog: Animal {
    
    let canBite: Bool
    
    init(name: String, canBite: Bool = true) {
        self.canBite = canBite
        super.init(with: name)
    }

    override func sound() -> String {
        return "\(name) make sound: 'gaw-gaw'"
    }
    
    // method overloading
    func feed(_ meal: Food, canBite: Bool) -> String {
        if canBite,
            meal.meal.contains("Meat") {
            return "I have eaten meat"
        } else {
            return "I want milk instead of meat"
        }
    }
    
    override func feed(with meal: Food) -> String {
        return feed(meal, canBite: self.canBite)
    }
}

// Polymorphism - ability to use different objects through the same interface
// while each behaves in its own unique way

class Home {
    let animals: [Animal]
    
    init(animals: [Animal]) {
        self.animals = animals
    }
    
    func makeSound() {
        for animal in animals {
            print(animal.sound())
        }
    }
}



let ourMeal = Food(meal: ["Meat", "Cheese", "Candies"])

let myCat = Cat(name: "Myrchuk", dateOfBirth: Date(timeIntervalSinceNow: 0))
myCat.name
myCat.dateOfBirth
myCat.feed(with: ourMeal)

let petDog = Dog(name: "Bobik", canBite: false)
petDog.feed(with: ourMeal)

let guardDog = Dog(name: "Rex")
guardDog.feed(with: ourMeal)

let myHomePets = Home(animals: [myCat, petDog, guardDog])
myHomePets.makeSound()


/**
 SOLID - design principles intended to make software designs more understandable, flexible and maintainable.
 
 - The Single Responsibility Principle: a class should have only a single responsibility
 */
