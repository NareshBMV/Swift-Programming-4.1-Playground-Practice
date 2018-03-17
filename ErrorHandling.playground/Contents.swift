//Error Handling
//Representation and throwing errors
//Represented by values of types Error
//Enumeration is best suited for error values defining
enum VendingMachineError:Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded:Int)
    case OutOfStock
}

//Throw error when something unexpected is happened
//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

//Handling Errors
//1.Propagate the error from a function to the code that calls that function
//2.do-catch statement
//3.optional value
//4.assert that the error will not occur
//try, try!, try? in places where error occurs

//Unwinding the call stack is not done in swift when compared to other propgramming language exception handling
//It treats throw statement as return statement from the function and is not expensive
//Stack unwinding is modifying the stack (Keeps the function that is currently executing)

//Propogating error using throwing function
//throws keyword is used in method header for function that throws error
// func throwingFunction() throws -> String ;throwing function
// func nonThrowingFunction() ; non-throwing function
//Vending Maching Sample Code
struct Item{
    var price:Int
    var count:Int
}

class VendingMachine {
    var inventory = ["Candy" : Item(price:10,count:5),
                     "buscuit" : Item(price:10,count:5),
                     "cake" : Item(price:10,count:5)
                    ]
    var coinsDeposited = 0
    
    func vend(name:String) throws {
        print(name)
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        guard item.price == coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: (item.price - coinsDeposited))
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing : \(name)")
    }
    
    
    //Propagate error further
    let favorite = [
        "Alice":"Chips",
        "Anuj":"Chocalete",
        "Bharath":"lollipup",
        ]
    
    func buyFavoriteSnack(person:String , vend:VendingMachine) throws {
        let snackName = "Candy"
        try vend.vend(name: snackName)
    }
}



//propagation in initializer
struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(name: name)
        self.name = name
    }
}

//Handling errors using do catch
//do-catch statement is used
//do {
//    try expression
//    statements
//} catch pattern 1 {
//    statements
//} catch pattern 2 where condition {
//    statements
//} catch {
//    statements
//}
print("Data")
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 5
do {
    try vendingMachine.buyFavoriteSnack(person: "Naresh", vend: vendingMachine)
    print("Success!!")
} catch VendingMachineError.OutOfStock {
    print("Out of stock!!")
}
catch VendingMachineError.invalidSelection {
    print("Invalid Selection!!")
}
catch VendingMachineError.insufficientFunds(let value) {
    print("Amount still needed \(value)")
} catch {
    print("Unexpected error: \(error).")
}


//Error which is not of general case can be handled within the functionality
func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(name: item)
    } catch is VendingMachineError {
        print("Invalid selection, out of stock, or not enough money.")
    }
    defer {
        print("Before Error Thrown")
    }

}
do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}

//Converting Error to optional Value
//try? is same like bypassing the error
//try? is used to evaluate the expression to nil if it has any error


//Disabling Error Propagation
//try! is used -- application will be crashed
//do-or-die situation

//try
//pass the error simply to next calling funciton
//handling error using do-catch block

//Specifying Cleanup Actions
//defer statement used irrespective error occured in the block
func checkDeferStatement() {
    let constant = 2
    
    print("First Statement")
    
    //    throw VendingMachineError.invalidSelection
    defer {
        print("first defer statement")
    }
    
    defer {
        print("second defer statement")
    }
    
    defer {
        print("third defer statement")
    }
    
    print("Last Statement")
}

checkDeferStatement()









