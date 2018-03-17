//: Playground - noun: a place where people can play
//Without closure and with simple function as argument to closure
let array = ["Bharath","Sunil","Naresh","Indira","Suresh"]
func backward(_ s1:String,_ s2:String)->Bool {
    return s1>s2
}
let sortedWithoutClosure = array.sorted(by: backward)
print(sortedWithoutClosure)

//Closure Expression syntax
let expressionSyntax = array.sorted(by: {(s1:String, s2:String) -> Bool in return s1<s2 })
print(expressionSyntax)

//infer type from context
let typeFromContext = array.sorted(by: {
    s1,s2 in return s1>s2
})

print(typeFromContext)

//Single expression closure no need return keyword
let singleExpression = array.sorted(by: {s1,s2 in s1>s2})
print(singleExpression)

//Shorthand argument names
let shorthandArgs = array.sorted(by: {$0>$1})
print(shorthandArgs)

//Operator Method
let operatorMethod = array.sorted(by: <)
print(operatorMethod)

//Checking Trailing closure topic
func checkClosure(closure:()->Void){
    //Closure parameter
    //Cannot have argument label
}

//Calling closure
checkClosure(closure: {})

//Trailing closure
checkClosure() {
    
}

//Checking with sorted function call
let arrayChecking = array.sorted(){$0>$1}
print("Array Checking : \(arrayChecking)")

//If closure is the only argument in the function then no need of "()"
let arrayChecking2 = arrayChecking.sorted{$0>$1}
print("Array Checking 2 : \(arrayChecking2)")

let digitNames = [0:"Zero", 1:"One", 2:"Two",3:"Three", 4:"Four",5:"Five",6:"Six",7:"Seven",8:"Eight",9:"Nine"]
let numbers = [16,58,510]
let stringArray = numbers.map{(number)->String in
    var num = number
    var str = ""
    repeat {
        str = digitNames[num%10]!+str
        num /= 10
    }while num > 0
    return str
}

print(stringArray)

//Capturing values (Storing and accessing values in surrounding context)... Example illustrates nested function
func makeIncrementer(forValue amount:Int)->()->Int {
    var referenceAmount = 0
    func incrementer()->Int {
        referenceAmount += amount
        return referenceAmount
    }
    return incrementer
}

var valueChange = makeIncrementer(forValue: 10)
print(valueChange())
print(valueChange())
print(valueChange())

var valueChangeDiff = makeIncrementer(forValue: 7)
print(valueChangeDiff())
print(valueChangeDiff())
print(valueChange())

//Closure are reference types
//when ever constant is assigned to a function or closure, it contains to reference to function or closure
//but not wrt to changes in function or closure
let anotherValueChange = valueChange
print(anotherValueChange())

//If making closure as @escaping means have to refer self explicitly
//If making closure as @nonescaping means have to refer self implicitly
var completionHandlers:[() -> Void] = []
func someFunctionWithEscapingClosure( completionHandler:@escaping ()->Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure:()->Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }// self explicitly escaping
        someFunctionWithNonescapingClosure { x = 200 }//self implicitly non escaping // called first
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
completionHandlers.first?()
print(instance.x)

//Autoclosures
//it doesnt take any argument and when its called it returns the value of expression thats wrapped inside it
var arrayExamp = ["a","e","i","o","u"]
print(arrayExamp.count)
let remove = { arrayExamp.remove(at: 0) }
print(arrayExamp.count)
remove()
print(arrayExamp.count)

//Closure as argument to a fuction
func serve(customer customerProvider:() -> String) {
    print("Now Serving \(customerProvider())!")
}
serve(customer: {arrayExamp.remove(at: 0)})

func serveAutoClose(customer customerProvider:@autoclosure () -> String) {
    print("Now Serving \(customerProvider())!")
}
serveAutoClose(customer: arrayExamp.remove(at: 0))//no flower braces

//both @escape and @autorelease
var customerProviders: [() -> String] = []

func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

collectCustomerProviders(arrayExamp.remove(at: 0))
collectCustomerProviders(arrayExamp.remove(at: 0))

print("Collected \(customerProviders.count) closures.")

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}



//Question : Add +5 to a given array and return only even numbers
let arraySample = [10,5,6,3,4,1,2]
let addingConstant = arraySample.map({(number)-> Int in return number+5})
print("Array after adding 5 : \(addingConstant)")
let fetchOnlyEvenNumbers = addingConstant.filter{$0 % 2 == 0}
print("After adding only Even Numbers : \(fetchOnlyEvenNumbers)")

















