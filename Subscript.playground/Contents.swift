//Subscript
//used to set and retrieve values of array,list,dictionary without needing separate methods
//can be used with class, structure, enumeration
//It is not restricted to single dimension, but can also be used in multi-dimension
//Syntax is similar to stored and computed properties
//Subscript keyword for definition
//Subscript sample
//can also user getter and setter similar to any other properties
struct ThreeTimesTable {
    let multiplier:Int
    subscript(index:Int)->Int {
        //This is read only subcript
        return multiplier*index
    }
}

var readOnlySubscript = ThreeTimesTable(multiplier: 3)
print(readOnlySubscript[5])

//simplest way using subscript
for index in 1...10 {
    print(readOnlySubscript[index])
}

for index in stride(from: 3, to: 31, by: 3) {
    print(index)
}

//inout parameter cannot be used in subscript definition
//class or structure can have multiple subscripts called as subscript overloading
//Access to specific subscript is based on values being passed
//Subscript with multiple parameter sample
//Two dimensional array calculation (row*column)+column
struct Matrix {
    var rows:Int, columns:Int
    var grid:[Double]
    init(row:Int, column:Int) {
        rows = row
        columns = column
        grid = Array(repeatElement(0.0, count: rows*columns))
    }
    
    func indexIsValid(row:Int, column:Int) -> Bool {
        return row<rows && row>=0 && column>=0 && column<columns
    }

    subscript(rowIndex:Int, columnIndex:Int)->Double {
        get {
            assert(indexIsValid(row: rowIndex, column: columnIndex), "Index Out Of Range")
            return grid[(rowIndex * columnIndex) + columnIndex]
        }
        set{
            assert(indexIsValid(row: rowIndex, column: columnIndex), "Index Out Of Range")
            grid[(rowIndex * columnIndex) + columnIndex] = newValue
        }
    }
}

var matrix:Matrix = Matrix(row: 2, column: 2)
print(matrix[1,1])
matrix[1,0] = 4
matrix[0,0] = 7
matrix[0,1] = 5
matrix[1,1] = 10
print(matrix)
print(matrix[1,1])












