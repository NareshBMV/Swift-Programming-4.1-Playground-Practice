func greet(name : String) -> String {
let greet = "Hello " + name + "!"
return greet
}

print(greet(name: "Naresh"))

//Simplying return statement
func greetAgain(name:String) -> String {
    return "Hello greeting " + name + " again"
}

print(greetAgain(name: "Naresh"))

//Ignoring return type of function
func printAndCount(value:String)-> Int {
    print("Value : \(value)")
    return value.count
}

func printOnly(value:String) {
    printAndCount(value: value)
}

print(printAndCount(value: "Naresh"))
print(printOnly(value: "Babu"))//does'nt Return Value

//Multiple return values in single function
func minMax(array:[Int]) -> (min:Int, max:Int) {
    var minimum = array[0]
    var maximum = array[0]
    
    for value in array[0..<array.count] {
        if minimum > value {
            minimum = value
        }
        
        if maximum < value {
            maximum = value
        }
    }
    
    return (minimum, maximum)
}

let boundValues = minMax(array: [3,5,2,1])
print(boundValues.min)
print(boundValues.max)


//let bounds = minMax(array: []) //Compile time error
//Optional tupes for safety
func reWriteMinMax(array:[Int]) -> (min:Int, max:Int)? {
    if array.isEmpty {
        return nil
    }
    var minimum = array[0]
    var maximum = array[0]
    
    for value in array[0..<array.count] {
        if value < minimum {
            minimum = value
        }
        if value > maximum {
            maximum = value
        }
    }
    return (minimum, maximum)
}

if let boundVal = reWriteMinMax(array: [0,5,3,6,2]) {
    print("Minimum : \(boundVal.min), Maximum : \(boundVal.max)")
}

//Defining and calling function with argument label with parameter
func personCalled(name:String, from homeTown:String) { //here "from" is argument lable used to have more expressive way
    print("Person \(name) is from \(homeTown)")
}

personCalled(name: "Naresh", from: "Bangalore")

//Skipping argument label with underscore
func checkArgument(_ firstParameter:String, secondParameter:String){
    //Skipping argument label
}
checkArgument("first", secondParameter: "second")//First Argument label skipped

//Default parameter values
func checkDefaultParameterValue(firstParameter:String, secondParameter:String = "DefaultValue") {
    print("First : \(firstParameter), Second : \(secondParameter)")
}

checkDefaultParameterValue(firstParameter: "FirstValue", secondParameter: "SecondValue")
checkDefaultParameterValue(firstParameter: "Only FirstValue")

//Variadic Parameters
func variadic(numbers:Double...) -> Double {
    var total : Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

print(variadic(numbers: 1,2,3,4,5,6,7,8,9,0))

//In-Out parameters to modify the values of parameter and persist the change even when function call ends
//Use & for parameter during function call
//Cannot use inout for literals and constants (variadic parameters)
func swapTwoInts(_ val1: inout Int, _ val2: inout Int) {
    let temVal1 = val1
    val1 = val2
    val2 = temVal1
}

var value1 = 101
var value2 = 102
swap(&value1, &value2)
print("Values after swapping : value1 - \(value1) || value2 - \(value2)")

//Initializing function to a variable
func addValues(_ first:Int , _ second:Int) -> Int {
    return first + second
}

func multiplyValues(_ first:Int , _ second:Int) -> Int {
    return first * second
}

var mathFunction:(Int , Int)->Int = addValues
print(mathFunction(1,2))
mathFunction = multiplyValues
print(mathFunction(3,4))

let anotherMathFunction = multiplyValues
print(anotherMathFunction(5,6))

//Function types as parameter types
func printMathFunction(_ mathFunction:(Int,Int)->Int, _ a:Int, _ b:Int) {
    print(mathFunction(a,b))
}
printMathFunction(multiplyValues, 10, 20)

//Function as returnType
func stepForward(_ val:Int)->Int {
    return val + 1
}
func stepBackward(_ val:Int)->Int {
    return val - 1
}

func moveNearerToZero(moment:Bool)-> (Int)->Int {
    return moment ? stepBackward : stepForward
}

var countVal = 4
var funcReturned = moveNearerToZero(moment: countVal>0)
while countVal != 0 {
    print(countVal)
    countVal = funcReturned(countVal)
}

//Nested Function
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")



