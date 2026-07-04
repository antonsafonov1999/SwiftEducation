//
//  Parking.swift
//  Education
//
//  Created by Anton Safonov on 04/07/2026.
//

class Auto {
   private var id: Int
    var numer: String
    var namesUser: String?
    var colorAuto: colorAuto
    var statusAuto: statusAuto
    
    enum colorAuto{
        case red
        case blue
        case black
        case white
    }
    enum statusAuto{
        case parking
        case drive
        case reserve
    }
    init( numer: String, namesUser: String? = nil, color: colorAuto, status: statusAuto) {
        self.id += 1
        self.numer = numer
        self.namesUser = namesUser
        self.colorAuto = color
        self.statusAuto = status
    }
    
}

class Parking{
    private var limitAutoToParking: Int = 10
    var listAuto: [Auto] = []
    
}

class ParkingManager{
    var parking: Parking = Parking()
    
    func parkingAutoInPlace(){
        
    }
    func createAuto(){
        
    }
    func SearchAllAouto(){
        
    }
    
}
