import Foundation

// MARK: - Direct dispatch

final class Childfree {
    func getChild() {
        print("Error")
    }
}


// MARK: - Virtual table

class Cat {
    func say() {
        print("meow")
    }
}

class Lion : Cat {
    override func say() {
        print("Это Нарния!")
    }
    
    func hunt() { }
}


// MARK: - Witness table

protocol ViewProtocol {
    func update()
}

class ViewController : ViewProtocol {
    func update() {
        print("updated")
    }
}


// MARK: - Message dispatch

@objcMembers
class Message : NSObject {
    dynamic func sayHello() {
        print("Hello")
    }
}

@objcMembers
class ImportantMessage : Message {
    override dynamic func sayHello() {
        print("Hello darkness my old friend")
    }
}
