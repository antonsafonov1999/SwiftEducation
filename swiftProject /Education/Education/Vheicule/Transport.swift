//
//  Transport.swift
//  Education
//
//  Created by Anton on 01/11/2025.
//

//1)время в пути
//•    стоимость поездки
//•    показывает, какой транспорт быстрее и дешевле


import Foundation


class Transport {
    
    var name: String = ""
    var timeToDestination: Double = 0 //время в пути
    var mediumSpeedToTransport: Double = 100// сред скорость
    
    static var distance: Double = 100
    
    
    init(name: String, mediumSpeedToTransport: Double) {
        self.name = name
        self.mediumSpeedToTransport = mediumSpeedToTransport
    }
    func timeToTravel() -> Double
    {
        timeToDestination = Transport.distance / mediumSpeedToTransport
        return timeToDestination
    }
    
}
