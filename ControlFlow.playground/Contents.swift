
//Dictionaries
var emptyDictionary = [String : String]()
print(emptyDictionary.count)
emptyDictionary["key"] = "value"
print(emptyDictionary)

var dictionaryLiterals:[String:String] = ["key1":"value1","key2":"value2"]
var alternateDictionaryLiterals = ["key1":"value1","key2":"value2"]

//Accessing or modifying
print(dictionaryLiterals.count)
dictionaryLiterals = [:]
if dictionaryLiterals.isEmpty {
    print("dictionary literal is empty")
}

dictionaryLiterals["key1"] = "value1"
print(dictionaryLiterals)
dictionaryLiterals["key1"] = "value"
print(dictionaryLiterals)

if let value = dictionaryLiterals.updateValue("data", forKey: "key1"){
    print(value)
} else {
    print("Key doesn't exists")
}

let value  = dictionaryLiterals["key1"]
dictionaryLiterals["key1"] = nil
print(dictionaryLiterals)
dictionaryLiterals.removeValue(forKey: "key1")

//Itterating over dictionary
for (key,value) in alternateDictionaryLiterals {
    print("\(key) : \(value)")
}

for keys in alternateDictionaryLiterals.keys {
    print(keys)
}
for value in alternateDictionaryLiterals.values {
    print(value)
}

let keyArray = [String](alternateDictionaryLiterals.keys)
let valuesArray = [String](alternateDictionaryLiterals.values)

//Control Flow
//For-in loop
let array = ["Sardar","Nehru","ekthaDivas"]
for item in array {
    print("\(item)")
}
let dictionary = ["Discovery Of India":"Jawaharlal Nehru","1995":"WHO","protection right of women":"Sarah","PhysicsNobel":"LIGO","podcast cars":"Personal Rapid Transit","Memristers":"Resovior Computing System"]
for (discoveries,info) in dictionary {
    print("\(discoveries) : \(info)")
}

//with index
for index in 1...5 {
    print("\(index) time 5 is \(5*index)")
}

var base = 3
var val = 1
var power = 10
//with out index
for _ in 1...10 {
    val *= base
}
print("\n 3 to the power of 10 \(val)")
//Half ranged
let minutes = 60
for index in 0..<60 {
    print(index)
    //Perform half range
}

//Regular Intervals
//Half ranged
print("\n Half Ranged Stride")
for interval in stride(from: 0, to: 12, by: 3) {
    print(interval)
}
//Full ranged
print("\n Full Ranged Stride")
for interval in stride(from: 0, through: 12, by: 3) {
    print(interval)
}

//While and repeat while(Snake and ladder example)
print("6 Multiples")
for index in stride(from: 6, through: 60, by: 6) {
    print(index)
}

//if Statement
let temperature = 90
if temperature > 90 {
    print("Its too hot")
} else {
    print("Climate is moderate")
}

if temperature <= 32 {
    print("Climate is cold")
} else if temperature >= 82 {
    print("Climate is too hot")
} else {
    print("Climate is moderate, neither too hot nor too cold")
}

//Switch
let charater = "a"
switch "a" {
case "a":
    print("a")//Case should have atleast one executable statement
case "A":
    print("A")
default:
    print("Nothing")
}

//Using range operators in Switch case Interval Matching
let approximateCount = 3
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1...5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default :
    naturalCount = "many"
}
print(naturalCount)

//Using Tuples
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):   //_ is called wildcard pattern
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

//Value Binding // name the value of temporary constants to variable and use it in the case body
let anotherPoint = (14, 1)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}


//Where to be used
let yetAnotherPoint = (1, 0)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}


let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}


let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

//Control Transsfer statements in Swift
//Continue, break, fallthrough, return, throw

//Continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    } else {
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)


//Break
let numberSymbol: Character = "三"  // Chinese symbol for the number 3
var possibleIntegerValue: Int?
//Latin Arabic Chinese Thai
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
     print("An integer value could not be found for \(numberSymbol).")
}

//Fall Through
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

//Early Exit ("guard")
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
greet(person: ["name": "Jane", "location": "Cupertino"])
