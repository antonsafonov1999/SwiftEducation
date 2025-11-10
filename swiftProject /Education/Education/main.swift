//
//  main.swift
//  Education
//
//  Created by Anton Safonov on 03/07/2025.
//

import Foundation

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
generic([1, 3, 54, 8, 11.5, 13, 20])
