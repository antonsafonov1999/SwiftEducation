//
//  Car.swift
//  Education
//
//  Created by Anton on 01/11/2025.
//


class Car : Transport
{
    init(_ name: String,_ mediumSpeedToTransport: Double)
    {
        super.init(name: name,  mediumSpeedToTransport: mediumSpeedToTransport)
    }
    
    override func timeToTravel() -> Double {
        print("how much is distance?")
        Transport.distance = Double(readLine() ?? "0") ?? 100
        
        timeToDestination = Transport.distance / mediumSpeedToTransport
       return timeToDestination
    }
}
