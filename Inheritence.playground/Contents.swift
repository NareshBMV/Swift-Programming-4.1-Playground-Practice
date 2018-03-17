
class multiply{
    
    var multiplier:Int
    init(number:Int) {
        multiplier = number
    }
    
    subscript(index:Int)->Int {
        return multiplier*index
    }
}

var multiplication = multiply(number: 3)
for index in 1...10 {
    print(multiplication[index])
}

struct Matrix {
    var  rows:Int, columns:Int
    var array:[Int]
    init(row:Int, column:Int) {
        rows = row
        columns = column
        array = Array(repeatElement(0, count: rows*columns))
    }
    
    func checkIndexValid(row:Int, column:Int) -> Bool {
        return (row >= 0) && (row < rows) && (column >= 0) && (column < columns)
    }
    
    subscript(row:Int, column:Int) -> Int {
        get{
            assert(checkIndexValid(row: row, column: column), "Index out of bound")
            return array[(row * column) + column]
        }
        set{
            assert(checkIndexValid(row: row, column: column), "Index out of bound")
            array[(row * column) + column] = newValue
        }
    }
}

var matrixStructure = Matrix(row: 2, column: 2)
print(matrixStructure)

matrixStructure[0,0] = 3
matrixStructure[0,1] = 4
matrixStructure[1,0] = 5
matrixStructure[1,1] = 6

print(matrixStructure[1,0])

//Inheritence
//Class which is not inherited from anyother class is baseclass
//Inheritence is not applicable for value types
//Lazy properties should always be var
//Lazy properties cannot have observers
//Computed properties can have observers only when they are inherited
class BaseClass{
    
    lazy var variable:String = "Lazy String"
    static var doNotChange = 1
    var normalStoredProperty = "I am stored Property"
    var computedProperty:Int{
        return 5+3
    }
    
    static func doNotChangeFunc(){
        doNotChange = 3
    }
    
    func changableFunc() {
        print("I can change myself \(normalStoredProperty)")
    }
}

class SubClass:BaseClass {
    override lazy var variable: String = "undetermine"

    override var normalStoredProperty: String{
        didSet{
            print(oldValue)
        }
    }

    //Cannot do this , inheritence cannot be added to read only computed and constant stored properties
//    override var computedProperty: Int{
//        didSet{
//
//        }
//    }

    override func changableFunc() {
        super.changableFunc()
        print("I Can change in subclass \(normalStoredProperty)")
    }
}

var subclass = SubClass()
print(subclass.variable)
subclass.changableFunc()
SubClass.doNotChangeFunc()
print(SubClass.doNotChange)

//Inheriting stored property with observer added
subclass.normalStoredProperty = "NewValue"
print(subclass.normalStoredProperty)

//If you provide a setter as part of a property override, you must also provide a getter for that override
//cannot provide both an overriding setter and an overriding property observer for the same property.
//cannot add property observers to inherited constant stored properties or inherited read-only computed properties.
//Can prevent inheriting for method, class, func ,class func, and subscript by writing keyword "final"




