//Initialization
//Primary role is to initialize all the stored properties of the class
//It is to setup before object is being created
//In swift initializers do not return any value as in objective c
//stored properties should not be left indeterminate state without assigning or initializing before object creation

class CheckInitializer {
    init() {
        //Initializer with no parameter
    }
}

//Initializer defining stored property on its initialization
class CheckInitializingStoredProperty {
    var farhrenheit:Int
    init() {
        farhrenheit = 32 //doesnot call any observers on its assignment on farhrenheit
    }
}
let initializser = CheckInitializingStoredProperty()
print("Temperature is \(initializser.farhrenheit) degree")

//Initializers with parameters
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)


//parameter names and argument labels
struct Color {
    let red, green, blue: Double
    init(red: Double,_ green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

let magenta = Color(red: 1.0, 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)


//Initializers parameter without argument labels
struct CelsiusWitoutArgumentLabels {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = CelsiusWitoutArgumentLabels(37.0)


//Property with optional type (Stored property which not necessary to set value during instance creation)
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()

//Assigning constant property
class SurveyQuestionConstant {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestionConstant(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not with cheese.)"

//classes and structure have default initializers
//Structure will have member wise initializers even though the properties are set with default initializers
struct SizeData {
    var width = 0, height = 0
    let data = "String"
}
let size = SizeData(width: 10, height: 12)

//Initializer deligation for value types
//If you want your custom value type to be initializable with the default initializer and memberwise initializer,
//and also with your own custom initializers, write your custom initializers in an extension rather than as part of the value type’s original implementation
//Initializer delegation sample
struct Size{
    var width = 0.0
    var height =  0.0
}

struct Point{
    var x = 0.0
    var y = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    init() {}
    init(origin:Point,size:Size) {
        self.origin = origin
        self.size = size
    }
    init(center:Point,size:Size) {
        let point = Point(x: (center.x-(size.width/2)), y: (center.y-(size.height/2))) //This is the initializer delegation in value types
        self.init(origin:point, size:size)
    }
}

let basicRect = Rect(origin: Point(x:4, y:4), size: Size(width: 8, height: 8))
print(basicRect.origin)
let basicRectVersion = Rect(center:  Point(x:4, y:4), size: Size(width: 8, height: 8))
print(basicRectVersion.origin)

//Class inheritence and initialization
//swift has two types of initializers
//designated and convenience initializers
//designated initializers; primary initializers and initialize all the stored property and then pass up to superclass to continue
//convinience initializers are supporting secondary initializers, to make initialization of class for further clearer we use this
//we use 'convinience' modifier for convinience initializers
//Syntax of designated and convenience initializers
class Syntax{
    init(){
        //Designated initializers
    }
   init(data:String){
        //Convenience Initializer
    }
}

class SubClass:Syntax{
    override convenience init(data:String){
        self.init()
    }
}


//Rules
//-Designated initializers should call designated initializer only
//-Convinience initializer should call another initializer from within class
//-Convinience initializer should ultimately call designated initializers

//Class initialization is Two phase initialization
//Safety checks
//SafetyCheck1 - Designated initializer must ensure all the properties in class are initialized before it delegate to superclass
//SafetyCheck2 - Designated initializer should headup before assigning value to the inherited property
//SafetyCheck3 - Convinience initializer must delegate to another initializer before assigning value to any property
//SafetyCheck4 - initializer cannot call any method or can do any functionality until first phase (i.e, all above) is completed


//Inheritence And Overriding
//Only designated initializers are overriden; subclass initializer is convinience initializer same as superclass designated initializer then also need to write override
//Sample for default initializer and designated initializer
class DefaultInit {
    var numberOfInteger = 2 //default
    var description:String{
        return "Value Of Integer \(numberOfInteger)"
    }
}

class DesignatedInitializer:DefaultInit {
    override init() {
        super.init()
        numberOfInteger = 4
    }
}

//Automatic initializer
//Illustrating convenience, designated and default initializers
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
print(namedMeat.name)
let mysteryMeat = Food()
print(mysteryMeat.name)


class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1) // Reduce code duplication with convenience initializer
    }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}


var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]

for item in breakfastList {
    print(item.description)
}

breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true

//Failable Initializer; init?
//Cannot define a failable and a nonfailable initializer with the same parameter types and names.
//Return nil within a failable initializer to indicate a point at which initialization failure can be triggered
//Return nil is used only for failure case and not success case
//Numeric conversion is failable initializer

//public init?(exactly source: Float) //For integer to floating point conversion if value is exact otherwise nil
let wholeNumber: Double = 12345.0
let pi = 3.14159
if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
}

let valueChanged = Int(exactly: pi)
if valueChanged == nil {
    print("\(pi) conversion to Int does not maintain value")
}

//sample for failable initializer
class Animal {
    var species:String
    init?(name:String) {
        if name.isEmpty {
            return nil
        }
        else {
            self.species = name
        }
    }
}

let someCreature = Animal(name: "Lion")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(name:"")
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

//Failable initializer for enumeration
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}

//Enumeration with raw value automatically receive failable initializer
enum Temporary:String{
    case one="One", two = "Two"
}

let val = Temporary(rawValue: "One")
if val != nil {
    print("Raw Value exists")
}

//Delegating to super class is possible in failable initializer
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil } // check condition before super class
        self.quantity = quantity//Quantity is not inherited so call or initialize before use
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}

// if you override a failable superclass initializer with a nonfailable subclass initializer,
//the only way to delegate up to the superclass initializer is to force-unwrap the result of the failable superclass initializer.
//cannot override non-failable initializer with failable initializer
//sample
class Document {
    var name: String?
    // this initializer creates a document with a nil name value
    init() {}
    // this initializer creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

//Forced Unwrap
class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

//init!  //triggers assertion failure if causes failure
//delegation to init! and init? and viceversa is possible
class DocumentInit {
    var name: String?

    init!(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}
//var docInit:DocumentInit = DocumentInit(name: "") //gives assertion failure

//Required initializer
//'required' modifier is used
//It is mandatory for subclass to implement the initializer if declased as required in superclass
//override is not used but only required keyword is used in subclass as well
//sample
class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}
class SomeSubclass: SomeClass {
    //error occurs if not declared
    required init() {
        print("Required")
        // subclass implementation of the required initializer goes here
    }
}
let someClass = SomeSubclass()


//Setting default property value with closure function
//Sample syntax
//class SomeClass {
//    let someProperty: SomeType = {
//        // create a default value for someProperty inside this closure
//        // someValue must be of the same type as SomeType
//        return someValue
//    }()
//}
//Sample code
struct Chessboard {
    let boardColors: [Bool] = {
        print("Inside Block of code")
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }() // Executed immediately when new value is created
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1))
print(board.squareIsBlackAt(row: 7, column: 7))





//Practice
//class MatricFunction{
//    var rows:Int
//    var columns:Int
//    var array:[Double]
//
//    init(row:Int, col:Int) {
//        rows = row
//        columns = col
//        array = Array(repeatElement(0.0, count: rows*columns))
//    }
//
//    func checkIndexValid(row:Int, col:Int) -> Bool {
//        return (row < rows) && (row >= 0) && (col < columns) && (col >= 0)
//    }
//
//    subscript(row:Int,col:Int)->Double{
//        get{
//            assert(checkIndexValid(row: row, col: col), "Index Out Of Range")
//            return array[(row*col)+col]
//        }
//        set {
//            array[(row*col)+col] = newValue
//        }
//    }
//}
//
//
//var matrix = MatricFunction(row: 5, col: 5)
//print(matrix[4,3])
//
//
//matrix[1,2] = 4
//print(matrix[1,2])
































