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
















