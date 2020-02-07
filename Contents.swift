import Foundation

// This is our stack structure. It is a struct with a variable for holding data, and three methods.

// The first method is our peek method, and returns the "top" of the stack (or in this case the last piece of data inserted into the stack). If the stack is empty, the function returns a string of "Empty".

// The second method is our pop method. This removes the itme that is on  the stack.

// The third method is the push method. This adds an item to the "top" of the stack.


struct StringStack {
    var array: [String] = []
    
    func peek() -> String {
        guard let topElement = array.first else { return "Empty" }
        return topElement
    }
    
    mutating func pop() -> String {
        return array.removeFirst()
    }
    
    mutating func push(_ element: String) {
        array.insert(element, at: 0)
    }
}


extension StringStack: CustomStringConvertible {
    var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        
        let stackElements = array.joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}

func directionsReduce(_ directions: [String]) -> StringStack {
    var reducedDirs = StringStack()
    for direction in directions {
        if(reducedDirs.peek() == "Empty" || !isOpposite(direction, reducedDirs.peek())) {
            reducedDirs.push(direction)
        } else {
            reducedDirs.pop()
        }
    }
    return reducedDirs
}

func isOpposite(_ direction1: String,_ direction2: String) -> Bool {
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

