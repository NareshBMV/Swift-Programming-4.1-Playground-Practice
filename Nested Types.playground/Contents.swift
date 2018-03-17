//Nested Types
//Enumeration used to support build utility classes and structures
//Enum , classes and structure can be nested within the types they support
//Types can be nested as many levels needed

//Sample code
struct BlackJackCard{
    enum suits:String {
        case spades = "S", hearts = "H", Diamonds = "D", Clubs = "C"
    }
    
    enum Rank:Int {
        case two = 2, three, four, five, six, seven, eight, nine
        case jack, queen, king, ace
        struct Values{
            var first: Int, second: Int?
        }
        var values:Values{
            switch self {
            case .ace:
                return Values(first: 10, second: 15)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue , second: nil)
            }
        }
    }
    
    let rank:Rank, suit:suits
    var description:String{
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

let theAceOfSpades = BlackJackCard(rank: .ace, suit: .spades)
print("theAceOfSpades: \(theAceOfSpades.description)")

//Can access nested type with the name that it is being nested in
let heartsSymbol = BlackJackCard.suits.hearts.rawValue
print(heartsSymbol)


