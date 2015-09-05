//: Playground - noun: a place where people can play

import UIKit

enum Opt<T> {
  case Some(T)
  case None
}

let c: Optional<String>


var str1 = "Hello, playground"

// Coding conventions
var a: Int = Int(3.0)

func anaAreMere() -> Void {
  println("asdasdsa")
}

anaAreMere()

// Spacing, paranthesis, ;

// Constants vs Variables
// Mutable vs Immutable
var ct = "Test"
ct = ct + "1"

let nemodificabil = "123312"
//error nemodificabil = nemodificabil + "ceva"

// Unicode 🐶🐮
let 🐶🐮 = "Caine si vaca"
println(🐶🐮)

// Type inference
let str = "Ana are mere"
let int = 3
let double = 4.3

// Tuples, named, not named, iterate
let tuple = (3, "Ana are mere")
tuple.0
tuple.1

func min() -> (min: Int, error: String) {
  return (3, "Ana are mere")
}

let arrTuple = [
  (3, "Ana are mere"),
  (5, "Oana are mere")
]

for (val, error) in arrTuple {
  println("\(val): \(error)")
}

// Optionals - Some or nil
// Special Enum
var opt: String?

println(opt)

//opt = "Ana are mere"

// Forced unwrap
//println(opt!)

if let optUnwrapped = opt {
  println(optUnwrapped)
} else {
  println("opt is nil")
}

var stri: String = ""
println(stri)

// Short if and ??
let ab = 3 > 0 ? "ana" : "banana"

let sh1: Int? = 3
let sh2: Int? = nil

println(sh2 ?? sh1)

// Arrays
var ar1 = [0, 1, 2, 3, 4, 5]
let ar2 = [6, 7, 8, 9, 10, 11]

println(ar1.append(6))
println(ar1)

// passed by value not reference!!!
var ar3 = ar1
ar3.append(7)

println(ar3)
println(ar1)

// Iterate ... ..< in enumerate
for el in ar1 {
  println(el)
}

//ar1.count
//for i in 0...ar1.count {
//  println("\(i): \(ar1[i])")
//}

for i in 0..<ar1.count {
  println("\(i): \(ar1[i])")
}

var arGol = [String]()
arGol.append("ana")
arGol.append("are")
arGol.append("mere")

//for (i = 0, i < ar1.count, i++) {
//  println("\(i): \(ar1[i])")
//}

// Dictionaries
//var dict: [String: Int] = [:]
var dict = [String: Int]()

dict["ana"] = 1
dict["are"] = 2
dict["mere"] = 1

dict["ana"] = 3

if let previousValue = dict.updateValue(5, forKey: "ana") {
  // A existat aici ceva inainte
  println(previousValue)
} else {
  // nu a existat aceasta cheie inainte
}

//dict["ana"] = nil -> CIUDAT
dict.removeValueForKey("ana")

for el in dict {
  println(el.0)
  println(el.1)
}

for (key, value) in dict {
  println("pentru cheia \(key) avem valoarea \(value)")
}

for key in dict.keys {
  println(key)
}

for val in dict.values {
  println(val)
}

// Short [:], [key: value]

// Enums

enum SpecialBool {
  case True
  case False
  case Maybe
}

let e = SpecialBool.False

let eLung: SpecialBool = .True

switch e {
case .True:
  println("is true")
case .False:
  println("is false")
case .Maybe:
  println("is maybe")
}

enum Status: String {
  case Activated = "activated"
  case NotActivated = "not_activated"
  case Disabled = "disabled"
}
//
//if json["status"] == "activated" {
//  //
//}

if let status = Status(rawValue: "activated") {
  println(status == Status.Activated)
} else {
  println("Could not parse enum from string")
}

// no break.. by default no fallthrough

// Switch
// No fallthrough
//
// Functions

class Test {
  func callURL(url: String, method: String, withParams: Int? = nil) {
    println(method)
  }
  
  func computeComplexCalculations(dict: [String: String], onComplete: () -> Void) {
    // Make calculations async
    onComplete()
  }
  
  func complexMethodCallback(onComplete: ((String, Int) -> Void)? = nil) {
    
  }
  
  var proprietate: String {
    willSet {
      println("will set value \(newValue)")
    }
    didSet {
      println("did set value \(proprietate)")
    }
  }
  
  func getService() -> String {
    // locate service
    return "service"
  }
  
  var testVar: Int!
  
  lazy var service: String = self.getService()
  
  init() {
    proprietate = "temp"
    testVar = 3
  }
}

let t = Test()

t.proprietate = "adsda"

t.callURL("www.google.com", method: "GET")
t.callURL("www.google.com", method: "GET", withParams: 3)

func onCompleteCalculations() -> Void {
  println("on complete calculations")
}

t.complexMethodCallback { (str: String, i: Int) -> Void in
  println(str)
  println(i)
}

t.computeComplexCalculations([:]) { () -> Void in
  
}

t.complexMethodCallback()
t.complexMethodCallback(onComplete: nil)

var moneyArray = [40, 50, 5, 100, 10]

var stringsArray = [String]()

for money in moneyArray {
  stringsArray.append("\(money)$")
}

println(stringsArray)

stringsArray = moneyArray.map({ (el: Int) -> String in
  return "\(el)€"
})

stringsArray = moneyArray.map({ return "\($0)€" })

stringsArray = moneyArray.map({ "\($0)€" })

let intArray = moneyArray.filter({ $0 > 30 })


// func someFunction(externalParameterName localParameterName: Int) {
//
// }
// _ parameter
// no need to specify the first param unless #
//func containsCharacter(#string: String, #characterToFind: Character) -> Bool {
//
//}
//func arithmeticMean(numbers: Double...) -> Double {
//  var total: Double = 0
//  for number in numbers {
//    total += number
//  }
//  return total / Double(numbers.count)
//}
//func swapTwoInts(inout a: Int, inout b: Int) {
//  let temporaryA = a
//  a = b
//  b = temporaryA
//}
//var someInt = 3
//var anotherInt = 107
//swapTwoInts(&someInt, &anotherInt)
//println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
//// prints "someInt is now 107, and anotherInt is now 3"
//
//Function as callbacks
//
//func backwards(s1: String, s2: String) -> Bool {
//return s1 > s2
//}
//var reversed = sorted(names, backwards)
//reversed = sorted(names, { s1, s2 in return s1 > s2 } )
// Implicit returns
//reversed = sorted(names, { s1, s2 in s1 > s2 } )
// Shorthand argument names
// reversed = sorted(names, { $0 > $1 } )
// Operator functions
//reversed = sorted(names, >)
//
//Enums
//enum CompassPoint {
//  case North
//  case South
//  case East
//  case West
//}
//
// Switch
//
// Raw values
// Initialize from raw value
//
// Classes vs structs vs enums - reference vs value types
//
// lazy stored properties
// get / set / willSet / didSet => newValue
//
// Inheritance
//
// Optional chaining
// Call methods through optional chaining
//
// Type casting
// as? as!
//
// AnyObject, Any
//
// Extensions in Swift can:
//
// Add computed properties and computed type properties
// Define instance methods and type methods
// Provide new initializers
// Define subscripts
// Define and use new nested types
// Make an existing type conform to a protocol
//
// Protocols
// class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
//  // class definition goes here
//}
//
// Generics
//func swapTwoValues<T>(inout a: T, inout b: T) {
//  let temporaryA = a
//  a = b
//  b = temporaryA
//}
//
//struct Stack<T> {
//  var items = [T]()
//  mutating func push(item: T) {
//    items.append(item)
//  }
//  mutating func pop() -> T {
//    return items.removeLast()
//  }
//}
//func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
//  // function body goes here
//}
//
// Associated Types typealias
//
// Access control
//
// global functions
//
// Map
// The map method solves the problem of transforming the elements of an array using a function.
//var moneyArray = [40, 50, 5, 100, 10]
//var stringsArray = [String]()
//
//for money in moneyArray {
//  stringsArray += "\(money)$"
//}
//
//Using map is just: stringsArray = moneyArray.map({"\($0)€"})
//
//
//Filter
//The filter method solves the problem of selecting the elements of an array that pass a certain condition
//
//var filteredArray : [Int] = []
//
//for money in moneyArray {
//  if (money > 30) {
//    filteredArray += [money]
//  }
//}
//
//filteredArray = moneyArray.filter({$0 > 30})
//
//
//Reduce
//The reduce method solves the problem of combining the elements of an array to a single value
//
//var sum = 0
//for money in moneyArray {
//  sum = sum + money
//}
//
//var product = 1
//for money in moneyArray {
//  product = product * money
//}
//
//sum = moneyArray.reduce(0,{$0 + $1})
//
//sum = moneyArray.reduce(0,+)
