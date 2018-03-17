//Extensions
//Add new functionality to existing class, structure, enumeration, and protocol types for which source is not accessible
//Called retroactive model
//Extension are similar to categories in objective c

//Extension can
//-Add computed instance property and computed type properties
//-protocol conformance
//-instance methods and type methods
//-nested types can be added
//-provide new initializer
//-add subscript
//Cannot override same method


class SomeType{
    
}

//Syntax
extension SomeType{
    //Extend Functionality
}

//Conforming protocol syntax
//Multiple inheritence is not possible but we can do it with protocol conformance
//extension SomeType:SomeProtocol,SomeProtocol2{
//    //syntax for protocol conformance
//}

//Computed Properties
extension Double {
    var cm:Double{
        return self*100
    }
    var m:Double{
        return self
    }
    var km:Double{
        return self*1000
    }
    var ft:Double{
        return self/3.28084
    }
    var mm:Double{
        return self/1000
    }
}

var finalValue = 45.m + 10.km
print("Final value in terms of meter \(finalValue)")

//Initializer
//Extension can add only convinience initializer but not designated or deinitializers
//For any type if default values are give to stored properties and do not have any kind of custom initializer then, in extension we can call default and memberwise initializer.
//This would not be the case if you had written the initializer as part of the value type’s original implementation
//Convinience initializer works only with class type
//Sample
struct Point{
    var x = 0.0, y = 0.0
}

struct Size{
    var width = 0.0, height = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
}


var rectDefault = Rect()
var rectMemberwise = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 5.5, height: 4.5))

extension Rect{
    init(center:Point, size:Size) {
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin: Point(x: originX, y: originY), size: Size(width: size.width, height: size.height)) //This can be called if only if not defined in actual class implementation
    }
}

var centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

//Methods
//can add new type methods and instance methods
//*********************************************
extension Int {
    func repeation(task:()->Void) {
        for _ in 0..<self {
            task()
        }
    }
}

8.repeation {
    print("I am repeating")
}

//Mutating Instance methods
//Structure and Enumeration to modify and access self modification in instance method then method needs to be mutate
//In extension if we want to modify self, we need to mutate the function in extension
extension Int{
    mutating func square(){
        self = self * self
    }
}
//print(5.square())// Literals are not mutatable
var num = 5
num.square()


//Subscript
extension Int{
    subscript(index:Int)->Int {
        var deci = 1
        for _ in 0..<index {
            deci *= 10
        }
        return (self/deci) % 10
    }
}

print(753894398493894839[6])
print(8989[6])

//Nested Types
//Can add new nested types to class, enumeration and structure

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}

printIntegerKinds([3, 19, -27, 0, -6, 0, 7])


//Additianal Practice
enum ErrorType:Error {
    case simpleError
}

class TemporaryClass {

    func checkTry() throws {
        throw ErrorType.simpleError
    }

    func checkTryAnother() throws {
        try checkTry()
    }


}

do{
    try TemporaryClass().checkTry()
    print("Inside do block")
} catch {
    print("Inside catch block")
}
defer {
    print("Defer Statement")
}


//Subscript Sample
struct Multiplication {
    var number:Int = 0
    subscript(index:Int)->Int{
        return number*index
    }
}

var multiplication = Multiplication(number: 4)
print(multiplication[5])


//Escaping is default before swift 3.0
//After Swift 3.0 Escaping is not by default
class A {

    var x = 0

    var arr: [(Int)->Void] = [(Int)->Void]()

    func usingEscaping(closure: @escaping(Int)->Void){
        print("Using Escaping")
        closure(15)
        arr.append(closure)
    }

    func usingNonEscapitn(closure:(Int)->Void) {
        print("Non Escaping")
        closure(10)
    }

    func callingClosureFunction() {
        usingEscaping { (value) in
            self.x = value
        }
        usingNonEscapitn { (value) in
            self.x = value
        }
    }
}

var classA = A()
classA.callingClosureFunction()
print(classA.x)




