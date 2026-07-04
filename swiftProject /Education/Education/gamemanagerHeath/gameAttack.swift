
//
//  gameAttack.swift
//  Education
//
//  Created by Anton Safonov on 04/07/2026.
//

protocol statusPerson {
    func plusHealth()
    func minusHealth(points: Double)
    
    func attack()
    func protection(p: Int) -> Double
    
}

class Hunter: statusPerson {
    
    private var Health: Double = 50
    private var pointToAttack: Int = 15
    private var pointToProtection: Double = 5.4
    private var statusHunter: statusHunter = .isAlive
    
    enum statusHunter {
        case isAlive
        case isDead
    }
    
    func plusHealth() {
        if self.statusHunter == .isDead {return}
        self.Health += 7
        if self.Health >= 50 {self.Health = 50}
        print("Персонаж выличился на 7 единиц и теперь имеет \(self.Health) единиц здоровья")
    }
    
    internal func minusHealth(points: Double) {
        self.Health -= points
        if self.Health <= 0 {self.Health = 0}
        print("Персонаж получил урон и теперь не живой")
        self.statusHunter = .isDead
    }
    
    func attack() {
        print("Персонаж аттаковал когото")
    }
    func getAttack(point: Int){
        if point == 0 {return}
        var pointGetAttack = protection(p: point)
        minusHealth(points: pointGetAttack)
    }
    internal func protection(p point: Int) -> Double {return Double(point) / self.pointToProtection}

}

class Monster : statusPerson {
    private var Health: Double = 100
    private var pointToAttack: Int = 45
    private var pointToProtection: Double = 2.8
    private var statusMonster: statusMonster = .isAlive
    
    enum statusMonster {
        case isAlive
        case isDead
    }
    
    func plusHealth() {
        if self.statusMonster == .isDead {return}
        self.Health += 7
        if self.Health >= 50 {self.Health = 50}
        print("Монстер выличился на 7 единиц и теперь имеет \(self.Health) единиц здоровья")
    }
    
    internal func minusHealth(points: Double) {
        self.Health -= points
        if self.Health <= 0 {self.Health = 0}
        print("Монстер получил урон и теперь не живой")
        self.statusMonster = .isDead
    }
    
    func attack() {
        print("Персонаж аттаковал когото")
    }
    func getAttack(point: Int){
        if point == 0 {return}
        var pointGetAttack = protection(p: point)
        minusHealth(points: pointGetAttack)
    }
    internal func protection(p point: Int) -> Double {return Double(point) / self.pointToProtection}

    
}
