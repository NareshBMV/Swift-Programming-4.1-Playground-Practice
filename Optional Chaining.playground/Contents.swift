//Optional Chaining
//Any link in optional chaning is nil then the enitire chain fails
//A property that normally returns an Int will return an Int? when accessed through optional chaining.
//Optional chaining provides use of ? instead of ! mark on accession in a chain

//Sample Code
class Person {
    var residence:Residence?
}

class Residence{
    var numberOfRooms = 2
}

var person:Person = Person()
//person.residence!.numberOfRooms //Force unwrap gives error in optional chaining as in optionals but there is alternative in chaining
person.residence?.numberOfRooms //use of ? mark, which is not in optional but only in optional chaining
//Use of optional binding
if let opt = person.residence?.numberOfRooms {
    print("There is value that exists in it!!! \(opt)")
} else {
    print("There is no value that exists in it!!!")
}

person.residence = Residence()
//print(person.residence?.numberOfRooms) //Calling property on optional will also be wrapped as optional  i.e, Int will be wrapped as Int?

if let opt = person.residence?.numberOfRooms {
    print("There is value that exists in it!!! \(opt)")
} else {
    print("There is no value that exists in it!!!")
}

//Defining Model Class for Optional Chaining
//Sample Modal Classes
class PersonSample {
    var residence:ResidenceSample?
}

class ResidenceSample {
    var rooms = [RoomSample]()
    var numberOfRooms:Int{
        return rooms.count
    }
    subscript(value:Int)->RoomSample {
        get{
            return rooms[value]
        }
        set{
            rooms[value] = newValue
        }
    }
    
    func displayNumberOfRooms() {
        print("Number Of Rooms are \(numberOfRooms)")
    }
    
    var address:AddressSample?
}

class RoomSample {
    var roomName:String
    init(name:String) {
        roomName = name
    }
}

class AddressSample {
    var buildingName:String?
    var buildingNumber:String?
    var street:String?
    func buildingIdentifier() -> String? {
        if let number = buildingNumber, let streetNum = street {
            return "Building Number:\(number), Street:\(streetNum)"
        }
        else if let buildingIdentity = buildingName {
            return buildingIdentity
        }
        else {
            return nil
        }
    }
}

//Accessing Properties through optional chaining
let john = PersonSample()
if let residence = john.residence?.numberOfRooms { //Optional has no value
    print("There is value")
} else {
    print("There is no value")
}
//Assigninment to righthand side is not evaluated is optional chain in left side is nil
let someAddr = AddressSample()
someAddr.buildingNumber = "55/3"
someAddr.street = "Silk Board"
john.residence?.address = someAddr //nil value bcoz reigh hand exp is not evaluated
//Can also be verifed as follows
func returnAddress()->AddressSample {
    print("Inside Returning Address Sample")
    let someAddress = AddressSample()
    someAddress.buildingNumber = "55/3"
    someAddress.street = "Silk Board"
    return someAddress
}
john.residence?.address = returnAddress()

//Calling Method through optional chaining
if john.residence?.displayNumberOfRooms() != nil {
    print("Can Access Method")
}
else {
    print("Cannot Access Method")
}

if (john.residence?.address = someAddr) != nil {
    print("Can Successfully Set The Value")
}
else {
    print("Cannot Set The Value Successfully")
}


//Accessing Subscript through Optional Chaining
//Place ? before the subscript bracket in optional chaining
if let firstRoom = john.residence?[0].roomName {
    print("First Room : \(firstRoom)")
}
else {
    print("There is no room value")
}

john.residence?[0] = RoomSample(name: "Leaving Room") //set to nil since optional nil on left side

let johnHouse = ResidenceSample()
johnHouse.rooms.append(RoomSample(name: "Leaving Room"))
johnHouse.rooms.append(RoomSample(name: "Lawn"))
john.residence = johnHouse
if let value = john.residence?[0].roomName {
    print("Room Name = \(value)")
}

//Accessing subscripts of optional type
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72

//Linking multiple levels of chaining
if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

let johnsAddress = AddressSample()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence?.address = johnsAddress //Residence is not nil so it is assignable to address value of residence

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).") // Possible bcoz residence is not nil now
} else {
    print("Unable to retrieve the address.")
}

//Chaining methods on optional return values
if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}

if let beginsWithThe =
    john.residence?.address?.buildingIdentifier()?.hasPrefix("The") { //Further chaining on function returning value
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}










