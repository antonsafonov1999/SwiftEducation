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
 
