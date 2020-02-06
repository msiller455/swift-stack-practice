import Foundation


struct StringStack {
    // LIFO Last In First Out
    var array: [String] = []
    
    func peek() -> String {
        guard let topElement = array.first else { return "Stack is empty" }
        return topElement
    }
    
    mutating func pop() -> String {
        return array.removeFirst()
    }
    
    mutating func push(_ element: String) {
        array.insert(element, at: 0)
    }
}

var nameStack = StringStack()

nameStack.push("Michael")
nameStack.push("Joe")
nameStack.push("Bob")

//print(nameStack)

extension StringStack: CustomStringConvertible {
    var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        
        let stackElements = array.joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}

func directionsReduce(_ directions: [String]) -> [String] {
    var reducedDirs = StringStack()
    reducedDirs.push(directions[0])
    for direction in directions[1...] {
        
    }
    return reducedDirs.array
}

func isOpposite(_ direction1: String, direction2: String) -> Bool {
    if((direction1 == "NORTH" && direction2 == "SOUTH")
        || (direction1 == "SOUTH" && direction2 == "NORTH")
        || (direction1 == "EAST" && direction2 == "WEST")
        || (direction1 == "WEST" && direction2 == "EAST")
    ) {
        return true
    } else {
        return false
    }
}

let testDirections1 = ["WEST", "WEST", "NORTH", "SOUTH", "EAST", "WEST"]
// SHOULD RETURN ["WEST", "WEST"]
let testDirections2 = ["SOUTH", "NORTH", "EAST", "WEST", "NORTH", "SOUTH", "WEST", "NORTH", "WEST", "EAST", "NORTH", "SOUTH", "WEST", "EAST"]
// SHOULD RETURN ["WEST", "NORTH"]
print(directionsReduce(testDirections1))
print(directionsReduce(testDirections2))

