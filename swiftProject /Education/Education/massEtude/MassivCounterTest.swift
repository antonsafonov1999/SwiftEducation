//
//  MassivCounterTest.swift
//  Education
//
//  Created by Anton Safonov on 11/07/2025.
//

var massive: [Int] = []

func CreationMassiv() {
    print("Введите размер массива от 0 до 10")
    if let input = readLine(), let Count = Int(input) {
        print("Размер масива - \(Count)\n")
        massive = Array(repeating: 0, count: Count)

    } else { print("Размер массива не правильный!"); CreationMassiv() }
}

func MassivCounter() {
    print("Заполните массив ! \n")

    for (i, n) in massive.enumerated() {
        print("Значение для индекса \" \(i)\" - ")
        while true {
            if let v = readLine(), let Value = Int(v) {
                massive[i] = Value
                break
            } else { print("значение не верное") }
        }
    }
}

var FilterMassive = { (mass: [Int]) -> [Int] in return mass.filter { $0 > 0 }}

func Compil(_ Func1: () -> Void, _ Func2: () -> Void, _ FilterMassive: ([Int]) -> [Int]) {
    Func1()
    Func2()
    print("\(FilterMassive(massive))")
}
