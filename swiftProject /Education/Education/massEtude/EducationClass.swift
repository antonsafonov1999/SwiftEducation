//
//  EducationClass.swift
//  Education
//
//  Created by Anton on 26/10/2025.
//

import Foundation
func SayHi(){print("Hello, func!")}

let SayHiClouser = {print("Hello, Clouser!")}

func sayName(name: inout String){print("Hello, \(name)")}

let sayNameClouser = {(name: String) in print("Hello, \(name)")}

func squarfunc(_ x: Int) -> Int
{
    return x * x
}

var squarCourse = { (x: Int) -> Int in
    return x * x
}

func calculate(_ a: Int, _ b: Int,
               operation: (_ a: Int, _ b: Int)-> Int) -> Int {
    return operation(a, b)
}
let sum = calculate(5, 3, operation: +)


class User{
    var name: String
    var age: Int
    var count: Double = 0.0
    var rate: Double = 0.0
    init()
    {
        name = "None"
        age = 0
    }
    init(name: String)
    {
        self.name = name
        self.age = 0
    }
    init (name: String, age: Int)
    {
        self.name = name
        self.age = age
    }
    func SetPerson (name: String, age: Int)
    {
        self.name = name
        self.age = age
    }
    func getPerson() -> (String, Int){return (self.name, self.age)}
    
    
}
 

func sum(_ mass:[Int], clouser: (_ x: Int) ->  Bool)
{
    for (i , y) in mass.enumerated()
    {
        if clouser(y)
        {
            print("\(i) - \(y)")
        }
    }
}

//sum([1, 3, 7, 8, 11, 13, 20]) { x in
//    return x % 2 == 0
//}

class teacher
{
    let name: String
    var description: String { return "Hi My name is \(name)!"}
    
    init(name: String)
    {
        self.name = name
    }
    func Work() {print("Hi, I'm working!, \nMy Descriprion is \(self.description)")}
    func a(){print("b")}
    
}
class IOSDeveloper: teacher
{
    override var description: String { return "Hi My name is \(name), and I'm iOS developer!"}
    
    override init(name: String)
    {
        super.init(name: name)
        
    }
    override func a(){print("a")}
}

let teacher1: teacher = teacher(name: "Anton")
let teacher2: IOSDeveloper = IOSDeveloper(name: "Petr")
let teacher3: teacher = IOSDeveloper(name: "bob")
let teacher4: teacher = IOSDeveloper(name: "tom")



func generic<T>(_ mass: [T]) -> Void{
   print("\(mass)")
}


class App
{
    var a: Int = 0
    func DoSum(a: Int, b: Int) -> Int
    {
        return a + b
    }
}

extension App
{
    func DoSum2(a: Int, b: Int) -> Int
    {
        return a + b
    }
}


class Pesron : App
{
    override func DoSum(a: Int, b: Int) -> Int
    {
        return a + b + 100
    }
}
struct Size{
    var width: Int = 2, height: Int = 1
}
struct Point
{
    var x: Int, y: Int
}
struct Rectangle
{
    var size = Size()
    var size2 = Size(width: 2, height: 3)
    
}



//mark: DELEGATE
protocol DelegateTeacher: AnyObject
{
    func TakeHomeWork()
    func TakeTest()
}
class Student
{
    var name: String = ""
    weak var delegate: DelegateTeacher?
    init(name: String)
    {self.name = name}
    
    func HomeWokr()
    {delegate?.TakeHomeWork()}
    
    func Examen()
    {delegate?.TakeTest()}
}

class Teacher: DelegateTeacher
{
    func TakeHomeWork() {
        print("Take home work")
    }
    
    func TakeTest() {
        print("Take test")
    }
    
    
}
class A: DelegateTeacher
{
    func TakeHomeWork() {
        print("Take home work")
    }
    
    func TakeTest() {
        print("Take test")
    }
    
    
}
var student1 = Student(name: "Anton")
var student2 = Student(name: "Petr")

var tech = A()

//student1.delegate = tech
//student1.Examen( )
//student1.HomeWokr()
