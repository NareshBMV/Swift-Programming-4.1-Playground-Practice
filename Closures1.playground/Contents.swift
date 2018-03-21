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




