//Propery
//Stored Properties are for structures and classes ; variables and constants
//Computed properties are used with structures, enumeration and classes and in this it is computed value
//Type properies
//Property Observers are used to monitor changes of stored property defined and also properties(stored or computed) that subclass inherits from superclass

//Stored Property
struct FixedLengthRange {
    var firstValue:Int //Variable stored property
    let range:Int //Constant stored property
}

var fixedRangeVar = FixedLengthRange(firstValue: 5, range: 5)
fixedRangeVar.firstValue = 10 // Can be changed bcoz its a variable stored property

let fixedRangeLet = FixedLengthRange(firstValue: 5, range: 5)
//fixedRangeLet.firstValue = 10  though fixedRangeLet is var it is not able to change its value as fixedRangLet instance of structure is constant

//Lazy Stored Property
//Initial value is not calculated until first time used
//Used with modifier 'Lazy'
//Used only with var
//It is used when initial value of property requires complex computation
//Lazy stored property sample

class Importer {
    var fileName = "data.pdf"
}

class Manager {
    lazy var importer = Importer()
    var array:[String] = [String]()
}

var manager = Manager()
manager.array.append("dataValue")

//importer instance is never being initialized since it is lazy
print(manager.importer.fileName) // only now importer is initialized

//Computed properties; do not store values and are used with classes, structures and enumeration
//they use getter and optional setter to retrieve and set values indirectly
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Center {
    var origin = Point()
    var size = Size()
    var center:Point{
        get{
            let x = origin.x + (size.width/2)
            let y = origin.y + (size.height/2)
            return Point(x: x, y: y)
        }
        
        set(center){
            origin.x = center.x - (size.width/2)
            origin.y = center.y - (size.height/2)
        }
    }
}

var squareData = Center(origin: Point(x: 0.0, y: 0.0), size: Size(width: 15.0, height: 15.0))
print(squareData.center)
squareData.origin = Point(x: 20.0, y: 20.0)
print(squareData.center)
squareData.center = Point(x: 10.0, y: 10.0)
print(squareData.origin.x)
print(squareData.origin.y)

// shorthand setter declaration
//'newValue' is default
struct ShorthandCenter {
    var origin = Point()
    var size = Size()
    var center:Point{
        get{
            let x = origin.x + (size.width/2)
            let y = origin.y + (size.height/2)
            return Point(x: x, y: y)
        }
        
        set{
            origin.x = newValue.x - (size.width/2)
            origin.y = newValue.y - (size.height/2)
        }
    }
}

//Read only computed properties
//will have only getter not setter
//only var bcoz it changes value all the time

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

//Property Observer
//Used to observe and respond to changes in property value
//cannot add to lazy stored properties
//can be applied to stored property and inherited computed property
//will set - before value is stored and default value is 'newValue'
//did set - after value is stored and default value is 'oldValue'
class StepCounter {
    var totalSteps: Int = 5 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
    
    func changeTotalSteps(total: inout Int) -> Int {
        total = 50
        return total
    }
    
    func changeVal(totalStep:Int) {
        print("Total Steps : \(totalSteps)")
    }
    
    func change()  {
        //with Inout
        changeTotalSteps(total: &totalSteps)
        //without Inout
        changeVal(totalStep: totalSteps)
    }
    
}

let stepCount = StepCounter()
stepCount.totalSteps = 10
print(stepCount.totalSteps)
stepCount.change()
//Note: if we pass property having observer as inout parameters to function then  willSet and didSet observers are always called

//property observers for overridden computed property sample code
class A {
    var number :Int {
        get {
            print("get")
            return 1
        }
        
        set {
            print("set")
        }
    }
}

class B: A {
    override var number: Int {
        willSet {print("willSet")}
        didSet {print("didSet")}
    }
}

let b = B()
b.number = 0


//Global constants and variables are always computed lazily
//So global constants and variables are no need to be defined with lazy modifier
//local variables are never computed lazily

//Type Properties
//Type properties are one in which there will be only one copy of these properties exists, no matter how many ever instances are being created
//These are like static variables in C-programming language
//Stored type properties:let, var ; Computed properties:var
//They are initialized lazily during first use and will guarantee only one time initialization; lazy modifier is not used with stored type properties
//user static keyword for stored properties and only for Class type use 'class' as modifier for computed properties for its type properties for others use static
struct TypePropertySampleStruct {
    static var buildStructVar = "buildValueVarStruct"
    static let buildStructLet = "buildValueLetStruct"
    static var computedPropertyStruct:Int{
        return 1
    }
}

enum TypePropertySampleEnum {
    static var buildEnumVar = "buildValueVarEnum"
    static var buildEnumLet = "buildValueLetEnum"
    static var computedPropertyEnum:Int{
        return 1
    }
}

class TypePropertySampleClass {
    static var buildClassVar = "buildValueVarClass"
    static let buildClassLet = "buildValueLetClass"
    class var computedPropertyClass:Int{
        return 1
    }
}

//Queried using dot on class or struct or enum name for type property
TypePropertySampleClass.buildClassVar = "valueClass"
print(TypePropertySampleClass.buildClassVar)
print(TypePropertySampleClass.buildClassLet)
print(TypePropertySampleClass.computedPropertyClass)

//Audio Channel Sample Code
struct AudioChannel {
    static let threshold = 10
    static var maximumInputLevelInChannel = 0
    var channelValue:Int = 0{
        didSet{
            if channelValue > AudioChannel.threshold {
                channelValue = AudioChannel.threshold
            }
            if channelValue > AudioChannel.maximumInputLevelInChannel {
                AudioChannel.maximumInputLevelInChannel = channelValue
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.channelValue = 11
print(AudioChannel.maximumInputLevelInChannel)
rightChannel.channelValue  = 9
print(AudioChannel.maximumInputLevelInChannel)


//Problem
//Filter number in array greater than zero
//Filter number in array less than count of the array
//Finally filter number in given array in which number not contain in sequence array upto number less than input array count value
let array = [-3,-4,3,2,1,5,7,8,9]
let array2 = Array(1...array.count-1)

let arr =  array.filter { (value) -> Bool in
    if value > 0 && value < array.count {
        return true
    }
    else {
        return false
    }
}

let finalArr = array2.filter{(value) -> Bool in
    if arr.contains(value) {
        return false
    }
    else {
        return true
    }
}
print(finalArr)


print("\n\n\n\n\n\n\n METHOD TOPIC")










