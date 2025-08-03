//
//  Untitled.swift
//  Education
//
//  Created by Anton Safonov on 28/07/2025.
//

enum NameError: Error{
    case empty
    case TooShort
}
enum AgeError: Error{
    case empty
    case TooShort
    case TooLong
}
func ValideForm(_ Name: String, _ Age: Int) throws -> String{
    if Name == nil && Name.isEmpty { throw NameError.empty}
    if Name.count < 3 {throw NameError.TooShort}
    if Age < 18 {throw AgeError.TooShort}
    if  Age >= 120 {throw AgeError.TooLong}
    
    return "Hello \(Name), you are \(Age) years old)"
}
func MainUserInput(){
    print("Enter Name And Age")
    let Name: String? = readLine() ?? nil
    let Age: Int? = Int(readLine() ?? "")
    
    do {
        let StringFormular: String = try ValideForm(Name!, Age!)
        print(StringFormular)
    }catch NameError.empty{
        print("Name is empty && Nil")
    }catch NameError.TooShort{
        print("Name is too short")
    }catch AgeError.TooShort{
        print("Age <18")
    }catch AgeError.TooLong{
        print("Age >=120")
    }catch{print("Неизвестная ошибка")}
}
