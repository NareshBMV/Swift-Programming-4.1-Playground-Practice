//: Playground - noun: a place where people can play

//Enumeration - Common types with group of related values
//Enum sample
//It will not implicitly assign integer values like 0,1,2,3... as in c or objective c in swift programming
enum CompassPoint{
    case east
    case west
    case north
    case south
}

//Multiple case in single line
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
}

var directionToHead = CompassPoint.north
print(directionToHead)
directionToHead = .east //Once assigned with enum type, then we can use shorthand . operator to access
print(directionToHead)

//Using switch case for enumeration comparision
switch directionToHead {
case .east: print("East Pointing")
case .west: print("West Pointing")
case .north:print("North Pointing")
case .south:print("South Poining")
}

//Switch case must be exhaustive
let planet = Planet.earth
switch planet {
case .earth:
    print("Safe Place For Human Beings")
default:
    print("Harmful for humans to leave")
}

//Enum cases can have values associated with it
//can also associate tuples
enum Barcode {
    case upc(Int,Int,Int,Int)
    case qrcode(String)
}

var codeAssociated = Barcode.upc(1023, 31, 4, 02837)
print(codeAssociated)
codeAssociated = .qrcode("ADcsdfreDSE322sD")
print(codeAssociated)

//switchcase for values associated
switch codeAssociated {
case .upc(let first, let second, let third, let fourth):
    print("UPC CODES \(first), \(second), \(third), \(fourth)")
case .qrcode(let value):
    print("QR-Code Value : \(value)")
}

codeAssociated = .upc(1023, 31, 4, 02837)
//Switch can also be re-written as
switch codeAssociated {
case let .upc(first, second, third, fourth):
    print("UPC CODES \(first), \(second), \(third), \(fourth)")
case let .qrcode(value):
    print("QR-Code Value : \(value)")
}

//Raw values alternative to associated values
//Raw values must be different for different cases
//Raw values must always be same but associated values are created when u create new variables or constants with enum case
enum ASCIICharacter:Character {
    case newLine = "\n"
    case carriageReturn = "\r"
    case tab = "\t"
}

print(ASCIICharacter.newLine.rawValue)
print("Naresh \r Babu")//Carriage Return

//Implicit Raw Values
enum PlanetRawValue:Int {
    case mercury = 1, venus, earth, mars, uranus, saturn, neptune, jupiter, pluto
}

print(PlanetRawValue.earth.rawValue)

enum CompassDirectionRaw:String {
    case north = "northDirection", south, east, west
}

print(CompassDirectionRaw.north.rawValue)
print(CompassDirectionRaw.east.rawValue)

//Initializing raw value is a failable initializer
let value = PlanetRawValue.init(rawValue: 9)
print(value)

let positionToFind = 3
if let value = PlanetRawValue.init(rawValue: positionToFind) {
    switch value {
    case .earth:
        print("Place for human beings to leave")
    default:
        print("Not suitable place to leave")
    }
}
else {
    print("There no planet available at polition \(positionToFind)")
}

//Recurrsive Enumeration- Another instance of enumeration is associated with one or more cases of enumeration.
//Indirect is used before case for recursive of before the enum if all the cases are recursive
//Associated values make it possible to nest an expression
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression) //For recursive Enumeration Expression
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression) //For recursive Enumeration Expression
}

//Can also be written as
indirect enum ArithmeticExpressionWithAllRecursive {
    case number(Int)
    case addition(ArithmeticExpressionWithAllRecursive, ArithmeticExpressionWithAllRecursive) //For recursive Enumeration Expression
    case multiplication(ArithmeticExpressionWithAllRecursive, ArithmeticExpressionWithAllRecursive) //For recursive Enumeration Expression
}

let num1 = ArithmeticExpression.number(5)
let num2 = ArithmeticExpression.number(6)
let add = ArithmeticExpression.addition(num1, num2)
let multiply = ArithmeticExpression.multiplication(num1, num2)

func evaluate(arithmeticExp:ArithmeticExpression) -> Int
{
    switch arithmeticExp {
    case let .number(value):
        return value
    case let .addition(exp1, exp2):
        return evaluate(arithmeticExp: exp1) + evaluate(arithmeticExp: exp2)
    case let .multiplication(exp1, exp2):
        return evaluate(arithmeticExp: exp1) * evaluate(arithmeticExp: exp2)
    }
}

let evaluatedExpression = evaluate(arithmeticExp: multiply)
print(evaluatedExpression)











