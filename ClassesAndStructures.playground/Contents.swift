//Classes and Structures
//flexible components and building blocks of program code
//Type casting, reference counting, deinitializers, and inheritence which are capable by classes not in structures
//Properties, methods, subscripts, extension, protocols are all common in both structures and methods
//Structures are always copied when passed around code and do not have reference count
//Memberwise initializer not possible for class
struct Resolution {
    var width = 0.0
    var height = 0.0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var name:String?
    var frameRate = 0.0
}

//Creating Instance
var resolution = Resolution()
var videoMode = VideoMode()

//Accessing Properties
print(resolution.width)
print(videoMode.resolution.height)//Accessing submember structure property
videoMode.resolution.width = 225.9//not possible in objective c
print(videoMode.resolution.width)

//Memberwise initializing in swift for Struct which is not possible for classes
var memWiseInitResolution = Resolution(width: 5.4, height: 4.4)

//Illustrating structure and enumeration are value types
//Value types are whose values are copied when assigned to variable or a constant
//Structure as value type
var beforeCopy = Resolution(width: 10.0, height: 11.0)
var afterCopy = beforeCopy
beforeCopy.width = 10.5
print("Value change after beforeCopy : \(beforeCopy.width)")
print("Value still in after copy : \(afterCopy.width)")

//Enumeration as value type
enum CompassDirection {
    case north, south, east, west
}
var beforeEnumCopy = CompassDirection.north
var afterEnumCopy = beforeEnumCopy
beforeEnumCopy = .east

if afterEnumCopy == .north {
    print("Value in afterEnumCopy variable is not changed but still copied")
}

//Illustrate Class as reference type
let tenEighty = VideoMode()
tenEighty.frameRate = 55.4
tenEighty.resolution = memWiseInitResolution
tenEighty.name = "1080HD"
tenEighty.interlaced = true

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 60.3
print("Checking for reference Value : \(tenEighty.frameRate)")

//Identical and non-identical operater
//(===) identical operator only used for reference types, is true if two reference poining to same reference type
//(!==) non-identical operator, true if not in the above case
if tenEighty === alsoTenEighty {
    print("Both constants are pointing to same object instance")
}

//Choosing between Class and Structure
//Use of structure
//when doesn't need to inherit
//encapsulate a few relatively simple data values
//copied rather than referenced

//Important note
//struct instances are allocated on stack, and class instances are allocated on heap, structs can sometimes be drastically faster
//Stack is used for static memory allocation and Heap for dynamic memory allocation, both stored in the computer's RAM .
//Variables allocated on the stack are stored directly to the memory and access to this memory is very fast












