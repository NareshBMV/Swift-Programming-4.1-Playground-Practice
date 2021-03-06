//Closures
//Closures are self contained blocks that can be passed around and used in code

//Closure Types
//Global function - named and do not capture value
//Nested function - named and capture value from enclosing function
//Closure expression - non-named and capture values from surrounding context

//Closure expression optimization
//--Infering parameter types and return types from context
//--Implicit return from single expression closure
//--Shorhand arguement
//--Trailing closure syntax

//Closure Expression - Inline Closure
//Sorted Method Sample
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1:String, _ s2:String) -> Bool {
    return s1<s2
}
let values = names.sorted(by: backward)
print(values)

let values2 = names.sorted { (s1, s2) -> Bool in
    return s1>s2
}
print(values2)

//Closure Expression Syntax
//in-out parameter can be used
//variadic parameter can be used
//But cannot have default values

//Inferring type from context
let withoutTypes = names.sorted(by: {s1,s2 in return s1>s2})
print(withoutTypes)

//Implicit return from single expression closure
let singleExpression  = names.sorted(by: {s1,s2 in s1>s2}) //Having single expression (s1>s2) so no need of return keyword

//Shorthand Argument names
let shorthandArgs = names.sorted(by: {$0>$1})
print("Shorthand : \(shorthandArgs)")

//Operator Method
let operatorMethod = names.sorted(by: >)
print("Operator Method : \(operatorMethod)")

//Trailing Closure
//If a closure is passed as argument to function then we can write closure expression after function call parantheses
//There is no need to write argument lable to a function call having closure
func trailingClosure(closure:()->Void) {
}
//Normal Closure Call
trailingClosure(closure: {
})
//Trailing Closure Call
trailingClosure {
}

//Sorting method with Trailing Closure
let sortingTrailingClosure =  names.sorted(){$0>$1}
print("sortingTrailingClosure : \(sortingTrailingClosure)")

//If closure is the only argument to a function then calling function no need to have parentheses
let noParenthesesClosure = names.sorted{$0>$1}
print("noParenthesesClosure : \(noParenthesesClosure)")

//Demo of Array Method map to show trailing closure
let digitsCount = [0:"Zero", 1:"One", 2:"Two", 3:"Three", 4:"Four", 5:"Five", 6:"Six", 7:"Seven", 8:"Eight", 9:"Nine"]
let number =  [12 ,555, 12345]

print("Mapping")
let numberToString = number.map { (number) -> String in
    var actualString = ""
    var num = number
    repeat {
        actualString = digitsCount[num%10]! + actualString
        num = num/10
    }while num > 0
    return actualString
}
print("numberToString : \(numberToString)")

//Capturing Values
//Simplest form of capturing values is nested function
//Nested function can capture values from its outer function
func makeIncrement(Increment amount:Int)->()->Int {
    var resultUpdate = 0
    func incrementer()->Int {
        resultUpdate += amount
        return resultUpdate
    }
    return incrementer
}


let increment = makeIncrement(Increment: 10)
increment()//calling closure nested function
increment()

let incrementByThirty = makeIncrement(Increment: 30)
incrementByThirty()
increment()
increment()
incrementByThirty()

//Function and closure are reference types
//Though functions are assigned to a constant ; constant will refer to those function or closlure
//sample resultUpdate above changes, even if the function is assigned to constant
let constant = increment //Though after assigning it still increments
constant()

//Escaping
//@noescaping is by default in swift3 but before it was specified explicitly and @escaping is default behaviour
//This is for memory optimization (@escaping can store the closure somewhere so memory storage optimization purpose it is not default in swift 3)
//Closure is said to escaping when closure is called after the function return
//Storing the closure outside variable and used later with escaping
var completionHandler:[()->Void] = []
func functionWithEscaping(closure :@escaping ()->Void) {
    completionHandler.append(closure)
}

//@escaping - refer self explicitly
//@noescaping - refer self implicitly
func functionWithNoEscaping(closure:()->Void) {
    closure()
}

class TestingEscapingAndNonEscaping {
    var x:Int = 10
    func doSomeThing() {
        functionWithEscaping { //Stored for later use
            self.x = 30 //Self specified explicitly
        }
        functionWithNoEscaping {
            x = 50
        }
    }
}

var obj = TestingEscapingAndNonEscaping()
obj.doSomeThing()
print(obj.x)

completionHandler.first?()
print(obj.x)

//Autoclosures
//It doesnt take any argument, when its called, it returns the value of expression thats wrapped inside it
//omits the braces
//Autoclosure lets you delay evaluation ; code is not evaluated until the closure is called
var customerInLine = ["A", "B", "C", "D", "E", "F", "G", "H"]
print(customerInLine.count)

var customerAutoClosure = {customerInLine.remove(at: 0)}
print(customerInLine.count)
customerAutoClosure()
print(customerInLine.count)

func serve(customer closure:()->String)
{
    print("Now Serving \(customerAutoClosure())")
}

serve (customer:{customerInLine.remove(at: 0)})

//Autoclosure
func serve(customer customerProvider: @autoclosure ()->String) {
        print("Now serving \(customerProvider())!")
}
serve (customer: customerInLine.remove(at: 0))

//@autoclosure @escaping
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customerInLine.remove(at: 0))
collectCustomerProviders(customerInLine.remove(at: 0))

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













