//Methods
//Functions associated with classes, structures, enumeration
//type methods can be defined in enumeration and structure which is not possible in objective c
//Defining methods
class CounterIncrement {
    var counter:Int = 0
    
    func increment()  {
        counter += 1
    }
    
    func incrementByValue(value:Int)  {
        counter += value
    }
    
    func reset() {
        counter = 0
    }
}

//Calling
var counterInc = CounterIncrement()
counterInc.increment()
print(counterInc.counter)
counterInc.incrementByValue(value:10)
print(counterInc.counter)
counterInc.reset()
print(counterInc.counter)


//self property
//It is assumed automatically that it refers to particular instance property of its type
//But in case if the method parameter name and instance property name is same then there will be ambiguity and it assumes it as method parameter name itself
class CheckSelf {
    var counter:Int = 0
    func incrementByValue(counter:Int)  {
        self.counter = counter//self is mandatary
    }
}
var checkSelf = CheckSelf()
checkSelf.incrementByValue(counter: 10)
print(checkSelf.counter)

struct PointsValue{
    var x:Int = 0
    var y:Int = 0
    
    func checkValue(x:Int) -> Bool {
        return self.x>x
    }
}

var points = PointsValue()
print(points.checkValue(x: -1))


//Mutating
//This keyword with function in enum and struct is mandatory for modifying the instance variables in function
//without this keyword it is not possible to modify the value
//structure sample
struct PointValue {
    var x:Int = 0
    var y:Int = 0
    mutating func change(xBeta:Int,yBeta:Int) {
        self.x = self.x + xBeta
        self.y = self.y + yBeta
    }
}

var structure = PointValue()
structure.change(xBeta: 10, yBeta: 10)
print(structure)

//Can also be written as
struct PointValueChange {
    var x:Int = 0
    var y:Int = 0
    mutating func change(xBeta:Int,yBeta:Int) {
        self = PointValueChange(x: (self.x + xBeta), y: (self.y + yBeta))
    }
}

var pointsChange = PointValueChange(x: 15, y: 15)
print(pointsChange)
pointsChange.change(xBeta: 15, yBeta: 15)
print(pointsChange)

//suppose structure is constant
let pointsChangeConstant = PointValueChange(x: 10, y: 10)
//pointsChangeConstant.change(xBeta: 15, yBeta: 15) results in error cannot be mutated as structure is constant

//Enumeration sample code
enum Operate {
    case high,low,veryHigh
    
    mutating func operateValue() {
        switch self {
        case .high:
            self = .veryHigh
        case .low:
            self = .high
        case .veryHigh:
            self = .low
        }
    }
}

//Mutating function in enumeration
var enumOperating = Operate.high
print(enumOperating)
enumOperating.operateValue()
print(enumOperating)
enumOperating.operateValue()
print(enumOperating)
enumOperating.operateValue()
print(enumOperating)


//Type Methods
//Enum, struct, classes can all have type methods
//Defined using static keyword
//class keyword is used for type methods in class for overriding in subclass
//accessed using dot
class SomeClass{
    static var string = "String Value"
    class func someMethod() {
        //type method for class
        print("Inside Type Method")
    }

    func simpleMethod() {
        print("Normal Method")
        SomeClassSub.someMethod() // Type name is mandatory
    }
}

class SomeClassSub:SomeClass {
    override class func someMethod() {
        super.someMethod()
        print("Inside Sub class")
    }
    func simpleSubClassMethod() {
        print(SomeClassSub.string)
    }
}

SomeClassSub.someMethod()
SomeClassSub().simpleMethod()
SomeClassSub().simpleSubClassMethod()

//Type methods can access only type methods and type property
//non-type methods can access type methods and type property using type name

//Level Tracker sample
struct LevelTracker {
    static var highestLevel = 1
    var currentLevel = 1
    
    static func unlockLevel(level:Int) {
        if level < highestLevel {
            highestLevel = level
        }
    }
    
    static func isUnlocked(level:Int)->Bool {
        return (level < highestLevel)
    }
    
    @discardableResult //suppress the compiler warning when the function or method that returns a value is called without using its result.
    mutating func advance(level:Int) -> Bool {
        if LevelTracker.isUnlocked(level: level){
            currentLevel = level
            return true
        }
        else {
            return false
        }
    }
}

//Player class using level tracker
class Player {
    var tracker = LevelTracker()
    var playerName: String
    
    func advance(level:Int) {
        LevelTracker.unlockLevel(level: level+1)
        tracker.advance(level: level+1)
    }
    init(name: String) {
        playerName = name
    }
}

var player: Player = Player(name: "A")
player.advance(level: 1)
print("Highest Level Traversed is : \(LevelTracker.highestLevel)")


var player2:Player = Player(name: "B")
player.advance(level: 5) // Will not unlock becoz its not being unlocked
print("Highest Level Traversed is : \(LevelTracker.highestLevel)")














