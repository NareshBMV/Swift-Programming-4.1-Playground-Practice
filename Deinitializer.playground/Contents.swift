//Deinitialization
//called immediately before class instance is deallocated
//deinit is used
//only for class types

//syntax
//deinit{
//    //deinitializer code
//    //such as resource not associated with class object to be released
//    //for example file closing
//}

//Deinitializer Sample
class Bank {
    static var coinsInBank = 10000
    
    static func distribute(coinsDistribute:Int) -> Int {
        let numberOfCoinsDistributed = min(coinsDistribute, coinsInBank)
        coinsInBank -= numberOfCoinsDistributed
        return numberOfCoinsDistributed
    }
    
    static func receive(coins:Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPocket:Int
    var value:String?
    
    init(coins:Int) {
        coinsInPocket = Bank.distribute(coinsDistribute: coins)
    }
    
    func coinsWin(coins:Int) {
        coinsInPocket += Bank.distribute(coinsDistribute: coins)
    }
    
    deinit {
        print("Inside De-initializer")
        Bank.receive(coins: coinsInPocket) //return money to bank on deallocation
        print("Coins Returned to bank \(coinsInPocket)") // can access class property
        print("Coins In Bank \(Bank.coinsInBank)")
    }
}

//create Player Instance
var player:Player? = Player(coins: 1000)// making optional type to deallocate i.e, assign nil
print("Checking Value")
print("Coins In Bank \(Bank.coinsInBank)")
print("Coins In Player One Pocket \(player!.coinsInPocket)")

//Player win 2000
player!.coinsWin(coins: 2000)
print("Coins In Bank \(Bank.coinsInBank)")
print("Coins In Player One Pocket \(player!.coinsInPocket)")

//de-allocate Object
player = nil





