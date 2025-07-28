//
// MassivGame.swift
//  Education
//
//  Created by Anton Safonov on 06/07/2025.
//

import Foundation

func Game() {
    // генерация поля
    var massiv = [String](repeating: "⬜️", count: 20)
    var BoomX = [3, 5, 9].randomElement()!
    let SaveZone = Int.random(in: 0 ... massiv.endIndex - 1); massiv[SaveZone] = "🟢"
    var gameOver = false
    while BoomX >= 0 {
        let index = Int.random(in: 0 ..< massiv.endIndex - 1)
        if index != SaveZone {
            massiv[index] = "🧨"
            BoomX -= 1
        }
    }

    print("""
    ==============
    ЗНАЧЕНИЕ: 
    "🧨" - Бомбы 
    "🟢" - ВЫХОД
    "⬜️"- БЕЗОПАСНАЯ ЗОНА
    ============== КАРТА ==============

    """)
    for element in massiv {
        print(element, terminator: " | ")
    }
    print("""


    ============== НАЧАЛО ИГРЫ ==============
    БРОСАЕМ КУБИК
    """)
    var Step = 0
    while gameOver == false {
        massiv[Step] = "⬜️"
        let RandomVar = Int.random(in: 1 ... 6)

        print("\nЗначение кубика - \(RandomVar)")
        Step = (Step + RandomVar) % massiv.count
        if Step == SaveZone {
            print("ВЫ ВЫИГРАЛИ")
            gameOver = true
        } else if massiv[Step] == "🧨" {
            print("ВЫ ПРОИГРАЛИ")
            gameOver = true
        }
        massiv[Step] = "🙋‍♂️"
        for element in massiv {
            print(element, terminator: " | ")
        }
    }
}
