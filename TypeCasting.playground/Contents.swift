//Type Casting
//Check the type of the instance
//treat the type as different superclass or subclass of somewhere in hierarchy
//is and as is used to do typecasting
//conform to protocol is also typecasting

//Defining class hierarchy for typecasting
class Media {
    var name:String
    init(name:String) {
        self.name = name
    }
}

class Movie:Media {
    var director:String
    init(name:String, director:String) {
        self.director = director
        super.init(name: name)
    }
}

class Song:Media {
    var singer:String
    init(name:String, singer:String) {
        self.singer = singer
        super.init(name: name)
    }
}

//Creating array containing Song and Media objects
//But array infers its type as Media, since both the class inherit commonly from Media type
//In order to use the specific features of Movie or Song we have to type cast or downcast
let array = [
             Movie(name: "EMC2", director: "Einstein"),
             Song(name: "We dont Talk", singer: "charlie puth"),
             Movie(name: "Citizen Kane", director: "Orson Welles"),
             Song(name: "The One And Only", singer: "Chesney Hawkes"),
             Song(name: "Never Gonna Give You Up", singer: "Rick Astley")
            ]
//Check Types
//'is' keyword is used
var movieCount = 0
var songCount = 0
for item in array {
    if item is Movie {
        movieCount += 1
    }
    if item is Song {
        songCount += 1
    }
}
print("Number of movies:\(movieCount) and songs:\(songCount) are there in array")

//Downcasting
//downcast to subclass type
//as?(conditional) ; as!(forced)
//as? if downcast fails it returns nil
//as! if downcast fails it will crash
for item in array {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.singer)")
    }
}

//Typecasting Any and AnyObject
//Any: any type and including function type as well
//AnyObject: type for only class type

var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

//Checking with switch statement
for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

//To use optional as any add cast Any to avoid warning
let optional: Int? = 3
things.append(optional)// this gives warning
things.append(optional as Any) //use to avoid warning











