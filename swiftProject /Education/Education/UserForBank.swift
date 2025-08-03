//
//  class.swift
//  Education
//
//  Created by Anton Safonov on 03/08/2025.
//

class User{
    var name: String
    var age: Int
    init (){ name = ""; age = 0}
    init(name: String, age: Int) {
        if age < 0 {self.age = 0}else {self.age = age}
        if name.isEmpty {self.name = "None"}else {self.name = name}
    }
    func ByMove()
    {
        print("Выберите фильм для покупки \n")
        var m = Move()
        m.PrintInfoMove()
        while true
        {
            var index: Int? = Int(readLine() ?? "") ?? 0
            if index != nil && index! - 1 > 0 && index! - 1 <= m.nameMove.count
            {
                print("Вы выбрали фильм - \(m.nameMove[index! - 1]) \n")
                return
            }else {print("Неверный индекс"); return}
            
        }
    }
    
}
class Move{
    var nameMove: [String] = ["Smurf", "Ant", "Cat"]
    var minPrice : [Double] = [100.0, 200.0, 300.0]
    var MinYear: [Int] = [15, 15, 19]
    
    func PrintInfoMove()
    {
        for (index , value) in nameMove.enumerated(){
            print("""
                \(index + 1)) Название фильма: \(value) \nЦена: \(minPrice[index])\nВозраст для просмотра - \(MinYear[index])
                """)
        }
    }
    func PrintInfoMove(Index : Int)
    {
        if nameMove.indices.contains(Index)
        {
            print("""
                \(Index)) Название фильма: \(nameMove[Index]) \nЦена: \(minPrice[Index])\nВозраст для просмотра - \(MinYear[Index])
                """)
        }else{print("по данному индексу не находится фильм")}
    }
    
    func AddMove(name: String, price: Double, MinYear: Int)
    {
        if name.isEmpty && price <= 0 && (MinYear <= 0 && MinYear >= 20){ print("Ошибка данный ввода нового фильма не может быть"); return}
        else
        {
            nameMove.append(name)
            minPrice.append(price)
            self.MinYear.append(MinYear)
        }
    }
}
