//Protocol
//Protocol defines blueprint of properties, methods and other requirement that suits particular task
//Protocol can be adopted by class, structure and enumeration type
//Any type that provide implementation or satisfy the requirements of protocol is said to conform to protocol
//We can extend protocols

//Syntax
class SuperClass{
    
}
protocol FirstProtocol {
    
}
protocol SecondProtocol {
    
}

struct ConformProtocol:FirstProtocol,SecondProtocol {
    
}

//If class has super class, then specify superclass before any protocol
class ProtocolConformance:SuperClass, FirstProtocol, SecondProtocol {
    
}

//Protocol Requirement
//variable always written with var keyword
//and gettable or gettable and settable can be written as
//{get} or {get set}
//sample
protocol SomeProtocol{
    var onlyGettable:Int{get}
    var gettableSettable:Int{get set}
}
//For type property prefix with static keyword
protocol StaticTypeProperty {
    static var property:Int{get set}
}

//Single Instance protocol
protocol FullyNamed {
    var fullName: String {get}
}
//Structure conforming to fullyNamed protocol
struct ProtocolConform:FullyNamed{
    var fullName: String
}
var protocolTesting = ProtocolConform(fullName: "Naresh")
print(protocolTesting.fullName)

class StarShip:FullyNamed {
    var name:String
    var prefix:String?
    init(name:String, prefix:String?=nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String{
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var starShip = StarShip(name: "Naresh", prefix: "ITC Infotech")
print(starShip.fullName)


//Method Requirement
//Same as method headers but without curly braces
//Variadic parameters are allowed
//Default values cant be specified
//For type methods use prefix static keyword
protocol StaticMethodProtocol{
    static func someMethod() //Class can conform this method by prefixing static or class(can be overriden by subclass)
}

//Single Instance method
protocol RandomNumberGenerator{
    func randomNumber() -> Double
}

//Conforming protocol
class LinearCongruentialGenerator:RandomNumberGenerator{
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func randomNumber() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.randomNumber())")
print("And another one: \(generator.randomNumber())")

//Mutating Method Requirement
//Mutating is marked to modify the instance in the method for structure and enumeration
//It is not necessary to write mutating for conforming protocol in class for a mutating function in protocol
protocol Togglable {
  mutating func toggle() // Mutating is mandatory for accessing instance in method for protocol conformance
}

class TestClass:Togglable {
    var string:String?
    func toggle() { //No need to prefix mutating keyword for function
        print("Class conforming to protocol")
    }
}

struct TestStruct:Togglable {
    var string:String
    var integer:Int
    mutating func toggle() {
        self.string = "Naresh"
        print("Conforming to protocol")
    }
}

var test = TestStruct(string: "String", integer: 1)


//Initializer Requirement
protocol SomeInitializer {
    init(value:Int)
}

//Class implementation of protocol initializer
//Class can conform to protocol init method either as designated or convenience initializer
//In both cases it has to add required keyword
//required - mandatory that subclass has to override the initializer
class SampleInitializer:SomeInitializer {
    required init(value: Int) {
        print("Initializer in class")
    }
}
//If class is final, then no need for required for conforming to protocol init, as final can't be subclassed
//If class inherits and then conforms to protocol with same init function then write required and then override keyword both
protocol ProtoSample {
    init()
}

class SampleSuperClass {
    init() {
        //superclass init
    }
}

class SampleScenario:SampleSuperClass,ProtoSample, SomeInitializer {
    required override init() {
        
    }
    
    required init(value: Int) {
        
    }
}

//Failable initializer requirement
//Failable initializer can be satisfied by failable or non-failable initializer
//non-failable initializer can be satisfied by non-failable or implecitly unwrapped failable initializer

//Protocols As Types
//Protocol can be used as other types in many places
//parameter type, return type in function, method or subscript
//constant type, variable or property type
//type of items in array, dictionary and other containers
//Sample showing protocol as variable type, method parameter and return type
class Dice {
    var sides:Int
    var generator:RandomNumberGenerator //Any protocol conforming type instance be used here
    init(side:Int,generate:RandomNumberGenerator) { //Generate can be instance of any conforming type
        sides = side
        generator = generate
    }
    func roll()->Int {
        return Int(generator.randomNumber() * Double(sides)) + 1
    }
}

var dice = Dice(side: 6, generate: LinearCongruentialGenerator()) //Protocol parameter type can be any conforming type
for _ in 1...6 {
    print(dice.roll())
}

//Delegation
//Design pattern that enables class or structure
//to delegate or hand of some responsibilities to instance of another type
//Implemented by defining protocol that encapsulates delegated responsibilities
//Conforming type gurantees implementation of functionalities
//delegation responds and retrieve the data from external sources without needing to know the underlying type

//Demonstrating Delegate design pattern with dice game
protocol DiceGame {
    var dice:Dice{get}
    func play()
}

protocol DiceGameDelegate:AnyObject{
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

//Note:-- To prevent strong reference cycle we need to declare delegate as weak reference
class SnakeAndLadderGame:DiceGame{
    let finalScore = 25
    let dice:Dice = Dice(side: 6, generate: LinearCongruentialGenerator())
    var square = 0
    var board:[Int]
    init() {
        board = Array(repeatElement(0, count: finalScore+1))
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    weak var delegate:DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop:while square != finalScore {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square+diceRoll {
            case finalScore:
                break gameLoop
            case let newScore where newScore > finalScore:
                continue gameLoop
                
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker:DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakeAndLadderGame {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let diceGame = SnakeAndLadderGame()
diceGame.delegate = tracker
diceGame.play()

//Adding Protocol Conformance with an Extension






