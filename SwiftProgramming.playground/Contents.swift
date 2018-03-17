//: Playground - noun: a place where people can play

import UIKit

//SWIFT 4.0

//SWIFT TOUR
var str = "Hello, playground"
print(str)



let width = "Width is "
let widthValue = 83
var finalValue = width + String(widthValue)
print(finalValue)

let apples = 3
let oranges = 5

//Multiline string with indentation
let quotation = """
Even though there's whitespace to the left, the actual lines aren't indented.
Except for this line.
Double quotes (") can appear without being escaped.
I still have \(apples + oranges) pieces of fruit.
"""
print(quotation)


//Array and dictionary samples
var array = ["Naresh", "Sunil", "BalaKrishna"];
print(array)
array[1] = "Ramki"
print(array)

var dictionary = ["Firsh":"Sunil", "Second":"Ramki"]
print(dictionary)
dictionary["Third"] = "Naresh"
print(dictionary)

print("\n\n ------------------------- \n\n")

//Control Flow

let individual = [100,20,50,45,200]
var teamScore = 0

for score in individual {
    if score > 50 {
        teamScore += 3
    }
}
print(teamScore)

var optionalString:String? = "I am optionalString"
print(optionalString == nil)
var optionalName:String? = "Naresh"
print(optionalName!)
if let name = optionalName{
    print("Optional Name \(name)")
}

//Checking nil
var optionalNamenil:String?
if let name = optionalNamenil {
    print("Inside Condition")
    print(name)
}

//default value for optional value
var optionalNil:String? = nil
var defaultValue = "DefaultValue"
print("Value Of OptionalNil is \(optionalNil ?? defaultValue)")

//Checking SwitchCase
var vegetables = "raddish pepper"

switch vegetables {
case "raddish":
    print("This is Vegetable")
case "tomato","ladies finger":
    print("Vegetable exists")
case let x where x.hasSuffix("pepper"):
    print("conditional")
case let x where x.hasPrefix("raddish"):
    print("conditional2")
default:
    print("DefaultCondition")
}

//checking for-in
let dictionaryCheck = [
    "prime" : [2,3,5,7,9],
    "odd" : [11,13,17,19,41,31],
    "even":[22,100,524],
]

var largest = 0
var type:String = ""

for (key,value) in dictionaryCheck {
    for number in value {
        if number > largest {
            largest = number
            type = key
        }
    }
}

print("Largest Number is : \(largest) and is of type \(type)")

//While and repeat while
var i = 0
while i > 10 {
    print("Inside While")
    i = i+10
}
print(i)

var j = 0
repeat {
    print("Inside Repeat While")
    j = j+1
}while j > 10
print(j)

//..< and ...
var dotLess = 0
var dotEqual = 0

for i in 0..<3 {
    dotLess = dotLess+i
}
print(dotLess)

for i in 0...3 {
    dotEqual = dotEqual+i
}
print(dotEqual)


//Defining Function
func greet(name:String, day:String, lunchSpecial:String)->String {
    return "Hi \(name), today is \(day), todays's special for lunch is \(lunchSpecial)"
}

print(greet(name: "Naresh", day: "Friday", lunchSpecial: "Pulav"))

//_ to use no argument label
func geetPerson(_ name: String,_ day:String)->String {
    return "Hi\(name) today is \(day)"
}

print(geetPerson("Naresh", "Thursday"))
print("Checking")

//Compuound return values to a function using tuple
func numberStatistics(values:[Int])->(min:Int,max:Int,sum:Int) {
    var min = values[0]
    var max = values[0]
    var sum = 0
    
    for number in values {
        if min > number {
            min = number
        }
        if max < number {
            max = number
        }
        sum = sum + number
    }
    return (min,max,sum)
}

let returnValue = numberStatistics(values: [10,3,5,6,7])
print("Minimum : \(returnValue.min) , Maximum : \(returnValue.max) , Summation : \(returnValue.sum)")

//Nested Function
func returnFifteen()->Int {
    var y = 10
    func add() {
        y = y+30
    }
    add()
    return y
}

print(returnFifteen())

//Function Returning Another Function as its value
func returnAnotherFunction()->((Int)->Int) {
    func addFourtyToNumber(number : Int)->Int {
        return number+40
    }
    return addFourtyToNumber
}

var returnAnotherFunc = returnAnotherFunction()
print(returnAnotherFunc(45))

//Function Taking Another Function As Argument
func funcTakeAnotherFuncAsArg(list : [Int], condition:(Int)->Bool)->Bool {
    for num in list {
        if condition(num) {
            return true
        }
    }
    return false
}

func checkIntegerIsGreaterThanTen(number:Int)->Bool {
    if number > 10 {
        return true
    }
    else {
        return false
    }
}

print(funcTakeAnotherFuncAsArg(list: [11,2,3,4,5], condition: checkIntegerIsGreaterThanTen))

//Closures
let numbers = [50,15,30]
let closureReturn = numbers.map({
    (number:Int)->Int in
    if number%2 != 0 {
        return 0
    }
    return number+3
})
print(closureReturn)

//Omit param and return type if already known
let closureReturns = numbers.map{ number in number*3 }
print(closureReturns)

let sortValues = numbers.sorted{$0<$1}
print(sortValues)

print("/n/n/n----------------------------------------------------------/n/n/n")
//Objects and Classes

class Shape {
    var numberOfSides = 0
    func description() -> String {
        return "There are \(numberOfSides) sides in shape"
    }
}

let shape = Shape()
shape.numberOfSides = 4
print(shape.description())

class NamedShape:Shape {
    var name:String
    
    init(name:String) {
        self.name = name
    }
    
    override func description() -> String {
        return "\(name) has \(numberOfSides) sides"
    }
}

class SquareShape:NamedShape {
    var sideLength:Double
    
    init(sideLength:Double, name:String) {
        self.sideLength = sideLength
        super.init(name: name)
        self.numberOfSides = 4
    }
    
    func area()->Double {
        return (self.sideLength*self.sideLength)
    }
    
    override func description() -> String {
        return "A \(name) with side : \(sideLength) and Area \(self.area())"
    }
}

let square = SquareShape(sideLength: 4.4, name: "Square")
print(square.description())

class CircleShape:NamedShape {
    var radius:Double
 
    init(radius:Double,name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area()->Double {
        return (22/7)*radius*radius
    }
    
    override func description() -> String {
        return "A \(name) with radius \(radius) and area is \(self.area())"
    }
}

let circleShape = CircleShape(radius: 3.0, name: "Circle")
print(circleShape.description())

//Getter and Setter
class EquilateralTriangle:NamedShape {
    var sideLength:Double = 0
    
    init(side:Double,name:String) {
        self.sideLength = side
        super.init(name: name)
    }
    
    var perimeter:Double{
        set{
            sideLength = newValue/3
        }
        get{
            return (3*sideLength)
        }
    }
    
    override func description() -> String {
        return "\(name) with side length \(sideLength)"
    }
}

let equilateralTriangle = EquilateralTriangle(side: 8.2, name: "Equilateral Triangle")
print(equilateralTriangle.description())
equilateralTriangle.perimeter = 21
print(equilateralTriangle.description())



//willSet is being tested and has to test for didSet property
class TriangleAndSquare{
    var square:SquareShape{
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    var triangle:EquilateralTriangle{
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    
    init(size:Double,name:String) {
        square = SquareShape(sideLength: size, name: name)
        triangle = EquilateralTriangle(side: size, name: name)
    }
}

let triAndSq = TriangleAndSquare(size: 10, name: "BothTriangleAndSquare")
print(triAndSq.square.sideLength)
print(triAndSq.triangle.sideLength)

triAndSq.square = SquareShape(sideLength: 50.0, name: "Square")
print(triAndSq.triangle.sideLength)

//Optional for expression
let squareOptional:SquareShape? = SquareShape(sideLength: 4.4, name: "Square")
print(squareOptional?.sideLength)

print("\n\n\n\n -----------------------------------------------------------------\n\n\n\n\n\n\n")
print("Enumeration And Structure")

enum Rank:Int {
    case ace = 1
    case one,two,three,four,five
    case jack, queen, king
    func simpleDescription()->String {
        switch self {
        case .ace:
            return "ace"
        case .one:
            return "one"
        case .jack:
            return "jack"
        default:
            return String(self.rawValue)
        }
    }
}

let val = Rank.ace
let rawVal = Rank.ace.rawValue
print("value:\(val)")
print("RawValue:\(rawVal)")


func compare(raw1:Rank, raw2:Rank)->String
{
    if raw1.rawValue < raw2.rawValue {
       return  raw1.simpleDescription() + " is lesser"
    }
    return raw2.simpleDescription() + " is lesser"
}

print(compare(raw1: .ace, raw2: .king))

if let convertedValue = Rank(rawValue:1) {
    print("Description is \(convertedValue.simpleDescription())")
}

enum Suits {
    case spades, hearts, diamonds, clubs
    func simpleDescription()->String {
        switch self {
        case .spades:
            return "Spades"
        case .hearts:
            return "Hearts"
        case .diamonds:
            return "Diamonds"
        case .clubs:
            return "Clubs"
        }
    }
    
    func color()->String {
        switch self {
        case .spades, .hearts:
            return "Black"
        case .diamonds, .clubs:
            return "Black"
        }
    }
}

let suitsEnum = Suits.spades
let suitsValue = suitsEnum.simpleDescription()
print("SuitsValue : \(suitsValue)")
print("Suite Color : \(suitsEnum.color())")

enum serverResponse{
    case result(String,String)
    case failure(String)
}

let success = serverResponse.result("9:30AM", "8:00PM")
let failure = serverResponse.failure("No data captured due to unexpected errors")

switch(failure) {
    case let .result(sunrise,sunset): print("success \(sunrise),  \(sunset)")
    case let .failure(failureMessage): print(failureMessage)
}


//Structure
struct Card {
    var rank:Rank
    var cards:Suits

    func sampleDescription() -> String {
        return "The discription is \(rank.simpleDescription()) and \(cards.simpleDescription())"
    }
}

let card = Card(rank: .three, cards: .spades)
print(card.sampleDescription())

//Protocols
protocol ExampleProtocol {
    var description:String{get}
    mutating func adjust()
}

class SampleProtocolClass:ExampleProtocol {
    var description:String = "A sample description"
    func adjust() {
        description += "extendingSampleProtocolClass"
    }
}

struct SampleProtocolStructure:ExampleProtocol {
    var description:String = "A sample struct description"
    mutating func adjust() {
        print("Inside Mutating Function")
        description += "ExtendingSampleProtocolStructure"
    }
}

let protocolClass = SampleProtocolClass()
protocolClass.adjust()
print(protocolClass.description)

var protocolStruct = SampleProtocolStructure()
protocolStruct.adjust()
print(protocolStruct.description)

//Mutating only applied for value types such as enum,struct
//Mutating is used for func to modify value type instance properties
//Example showing what Mutating actually means
struct Counter {
    let count: Int
    
    init(count: Int = 0) {
        self.count = count
    }
    
    // the functional approach
    func counterByIncrementing() -> Counter {
        let newCount = count + 1
        return Counter(count: newCount)
    }
}

var counter = Counter()
counter = counter.counterByIncrementing()
print(counter.count)

struct Counter1 {
    // this now has to be a var :/
    var count: Int
    
    init(count: Int = 0) {
        self.count = count
    }
    
    // the mutating keyword approach
    mutating func increment() {
        count += 1
    }
}

var counter1 = Counter1()
counter1.increment()
print(counter1.count)

//Enum Extending example protocol

enum SimpleEnum : String, ExampleProtocol {
    case Before = "before", After = "after"
    var description: String {
        get {
            return "A simple enum." + self.rawValue
        }
    }
    mutating func adjust() {
        self = .After
    }
}
var c = SimpleEnum.Before
print(c.description)
c.adjust()
print(c.description)


extension Int:ExampleProtocol {
    var description: String {
    
        get{
            return "number is \(self)"
        }
    }
    
    mutating func adjust() {
        self += 40
    }
}

let cons = 7.description
print(cons)


print("------------------------------------------------------------------------------")
//Error Handling
enum PrintError:Error {
    case outOfPaper
    case noToner
    case onFire
}

enum NetworkError: Error {
    case NetworkError
}

func printTask(task:Int, printerName:String) throws ->String {
    if printerName == "donar" {
        throw  PrintError.noToner
    }
    return "TaskDone"
}



do{
    let printerTask = try printTask(task: 1, printerName: "donar")
//    let printerTask = try printTask(task: 1, printerName: "data")
    print("Task Status Of Printer : \(printerTask)")
    
} catch {
    print(error)
}

//Multiple catches
do{
    throw NetworkError.NetworkError
    let printerTask = try printTask(task: 1, printerName: "donar")
    print("Task Status Of Printer : \(printerTask)")
    
} catch PrintError.noToner{
    print("Toner Error")
}catch let printError as PrintError {
    print(printError)
}catch {
    print(error)
}

//success case
let printerErrorByPassSuccess = try? printTask(task: 1, printerName: "data")
print("printErrorByPass : \(printerErrorByPassSuccess)")

//Failure case
let printerErrorByPassFailure = try? printTask(task: 1, printerName: "donar")
print("printErrorByPass : \(printerErrorByPassFailure)")

//Use of defer
var fridgeIsOpen = false
var fridgeItems = ["apple","mango","pine apple"]

func checkFruitInFridge(fruit:String)->Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
        print("Executing before return statement")
    }
    
    print("Fridge Status : \(fridgeIsOpen)")
    print("Check Fridge Status : \(fridgeIsOpen)")
    return fridgeItems.contains(fruit)
}

let checkStatus = checkFruitInFridge(fruit: "apple")
print("status : \(fridgeIsOpen)")


print("\n\n\n\n\n-----------------------------------------------------\n\n\n\n\n\n")
//Generics
func makeArray<Item>(repeating item:Item, numberOfTimes:Int)->[Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    
    return result
}

print(makeArray(repeating: "Naresh", numberOfTimes: 4))


//Re-implementing swift standard library Optional Type
enum OptionalType<wrapped>{
    case none
    case some(wrapped)
}

var possibleValue:OptionalType<Int> = .none
print(possibleValue)
possibleValue = .some(100)
print(possibleValue)

func anyCommonElements<T:Sequence,U:Sequence>(_ lhs:T, rhs: U)->Bool where T.Iterator.Element:Equatable, T.Iterator.Element == U.Iterator.Element {
    for left in lhs {
        for right in rhs {
            if left == right {
                return true
            }
        }
    }
    return false
}

anyCommonElements([3,4,5], rhs: [1,3])

print("\n\n\n\n\n\n\n\n\n-----------------------ACTUAL LANGUAGE GUIDE--------------------------")

var `var` = "Naresh"
print(`var`)
//print(`var`,defaultValue, separator: "|", terminator: "|")

let maxValue = UInt8.max
print(maxValue)
//let ma:UInt8 = 278//OverFlow error since uint max value is 255

let integer = 4
let floatValue = 3.456
let addition = Double(integer) + floatValue
let add = 4 + 3.456


typealias sample = UInt
print(sample.max)

let tuple = (404,"file not found")
print(tuple.0)
print(tuple.1)

let possible = "123"
let convert:Int? = Int(possible)
print(convert!)

//Implicitly Unwrapping Optionals
let optionalString1:String? = "Explicit Optional String"
let optionalStringValue1:String = optionalString1!
print(optionalStringValue1)

let optionalImplicit2:String! = "Data"
let optionalImplicitValue2:String = optionalImplicit2
print(optionalImplicitValue2)

if let value2 = optionalImplicit2 {
    print(value2)
}

typealias integervalue = Int
var value:integervalue = 123

//Assertion and Precondition

let age = -3
//assert(age >= 0, "Age cannot be negative value")
//print("Success")

//if age > 10 {
//    print("You can ride the roller-coaster or the ferris wheel.")
//} else if age > 0 {
//    print("You can ride the ferris wheel.")
//} else {
//    assertionFailure("A person's age can't be less than zero.")
//}



print("\n\n\n\n\n\n------------------Basic Operators------------------")
//Basic Operators
//Identity Operator === and !== for checking whether both reference pointing to same object

//Nil-Coalescing ??

//Range operators
//1. Closed Range
//2. Half Open Range
//3. One Sided Range

//Closed Range
for i in 1...5 {
    print("Index is :\(i)")
}

//Half Open Range
let dummyArray = ["dummy1","dummy2","dummy3","dummy4"]
for index in 0..<dummyArray.count {
    print("Index is \(index) and element is \(dummyArray[index])")
}

//ClosedRange as One sided Range
print("!st Case")
for item in dummyArray[...2] {
    print("Dummy data is \(item)")
}

print("!2 Case")
for item in dummyArray[2...] {
    print("Dummy data is \(item)")
}

//HalfOpen Range as One Sided Range
print("Half Open Range Case")
for item in dummyArray[..<2] {
    print("Dummy data is \(item)")
}

let range = ...5
print(range.contains(7))
print(range.contains(3))

//Strings
print("\n\n\n-------------------Strings------------------")
let multilineString  = """
"This is multiline string"
"""
print(multilineString)

//line break in multiline string '\'
let multilineLineBreak = """
Naresh \
Chaithra
"""
print(multilineLineBreak)
//Unicode Scalars
let unicodeValue = "\u{1F305} Happy Morning"
print(unicodeValue)

//escapint """ in multiline string
let testString = """
value is \"""
value 2 is \"\"\"
"""
print(testString)


//Character array as a string
let charArray:[Character] = ["c","a","t","!"]
let stringOfCharArray = String(charArray)
print(stringOfCharArray)

//Extended Grapheme Clusters
//U+1F1EE, U+1F1F3
let flagIndia = "\u{1F1EE}\u{1F1F3}"
print(flagIndia)
print(flagIndia.count)

var stringTemp = "Naresh"
print(stringTemp.count)
stringTemp += " Babu"
print(stringTemp.count)


//String Indices
//startIndex, endIndex, index(before:), index(after:),index(_:offsetBy:), used for string aswell as any collection type

let stringTesting = "Naresh"
print("\(stringTesting[stringTesting.startIndex])")
let indV = stringTesting.endIndex
print("\(stringTesting.last!)")
print("\(stringTesting[stringTesting.index(before: stringTesting.endIndex)]) || \(stringTesting[stringTesting.index(after: stringTesting.startIndex)])")
for index in stringTesting.indices {
    print("\n\(stringTesting[index])\n")
}
print(stringTesting[stringTesting.index(stringTesting.endIndex, offsetBy: -1)])
print(stringTesting[stringTesting.index(stringTesting.startIndex, offsetBy: 1)])

//Removing and inserting
//insert(_:at:), remove(at:), insert(contentsOf:at:), removeSubrange(_:)
var checkString = "NareshBabu"
checkString.insert("!", at: checkString.index(checkString.startIndex, offsetBy: 3))
print(checkString)
checkString.insert(contentsOf: "abc", at: checkString.startIndex)
print(checkString)

var checkString2 = "NareshBabuMV"
checkString2.remove(at: checkString2.startIndex)

var subStrRange = checkString2.index(checkString2.startIndex, offsetBy: 6)..<checkString2.endIndex
checkString2.removeSubrange(subStrRange)
print(checkString2)

//Substring
let substringStr = "Naresh,Babu"
let subStrRange2 = substringStr.index(of: ",") ?? substringStr.startIndex
let substrValue = substringStr[..<subStrRange2]
print(substrValue)
//To print Babu
let subStrRange1 = substringStr.index(of: "B") ?? substringStr.startIndex
let substrValue2 = substringStr[subStrRange1..<substringStr.endIndex]
print(substrValue2)



let dogFace = "\u{1F436}"
print(dogFace)


print("\n\n\n-------------------Starting With Collection Types----------------------------\n")
//Collections

var someInts = [Int]()
var repeatingArray = Array(makeArray(repeating: 1, numberOfTimes: 3))
print(repeatingArray)
var repeatingArray2 = Array(makeArray(repeating: 2, numberOfTimes: 3))
print(repeatingArray2)

//Adding Arrays
var arrayAddition = repeatingArray2 + repeatingArray
print(arrayAddition)

var shoppingList = ["A","B","C","D","E","F","G"]
print(shoppingList)
shoppingList[4...6] = ["E","F"]
print(shoppingList)
shoppingList.insert("Z", at: 0)

//Enumerated For-Loop for an array
for (index,value) in shoppingList.enumerated() {
    print("Item at index \(index) is \(value)\n")
}

//testing
//var temporaryString = "cricketmatch"
//var rangeVal = temporaryString.index(of: "m") ?? temporaryString.startIndex
//var substringValue = temporaryString[rangeVal..<temporaryString.endIndex]
//print("Substring : \(substringValue)")

var someInt = [Int]()
print("Some Integers with int count \(someInt.count)")
someInt.append(5)
print(someInt)
someInt = [] //Defining Empty Integer array

//Creating array default values
var tempArray = Array(repeatElement("Naresh", count: 5))
print(tempArray)

//Creating array By adding two arrays together
var tempArray2 = Array(repeatElement("Chaithra", count: 4))
var addingArray = tempArray + tempArray2
print(addingArray)

//Creating Array With Array Literals
var arrayWithLiteral:[String] = ["Str1","Str2","Str3"]
print("String Array : \(arrayWithLiteral)")

//Array literal created without type specifying "Type Inference"
var typeInferredArray = ["Str1","Str2","Str3"]
print(typeInferredArray)
//Additional assignment Operator
typeInferredArray += ["str4","str5"]
print(typeInferredArray)
//Accessing with subscript
print(typeInferredArray[0])
typeInferredArray[0] = "modifiedStr1"
print(typeInferredArray)


//Accessing array methods
print(typeInferredArray.count)
print(typeInferredArray.isEmpty)
print(typeInferredArray.last!)
print(typeInferredArray.first!)

//Adding and removing array items at particular index
typeInferredArray.insert("newInsert", at: 0)
print(typeInferredArray)

typeInferredArray.remove(at: 0)
typeInferredArray.removeLast()
print(typeInferredArray)

//Itterating over array
for item in typeInferredArray {
    print(item)
}
//Enumerated
for (index,item) in typeInferredArray.enumerated() {
    print("Index \(index+1) : \(item)")
}

//Modifyting range of values in array
typeInferredArray[1...3] = ["ModStr2", "modStr3"]
print(typeInferredArray)


//Sets
var setVar = Set<String>()
print("Count \(setVar.count)")
setVar.insert("a")
setVar = [] //Empty

var setVarLiteral:Set<String> = ["a","c"]
var setvarLiteralType2:Set = ["a"]

//Accessing and modifying set
print("SetVarLiteral Count \(setVarLiteral.count)")
print(setVarLiteral.isEmpty)

setVarLiteral.insert("b")
if let variable = setVarLiteral.remove("a"){
    print("value removed is \(variable)")
}

if setVarLiteral.contains("c") {
    print("Set Contains specied item")
}

//iterrating over Set
for item in setVarLiteral.sorted() {
    print("\(item)")
}

//Set Operation symmetric difference, intersection, subtraction, union
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()


let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)
houseAnimals.isStrictSubset(of: farmAnimals)
farmAnimals.isStrictSuperset(of: houseAnimals)

















