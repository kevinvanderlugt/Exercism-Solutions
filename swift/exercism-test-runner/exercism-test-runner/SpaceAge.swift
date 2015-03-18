//
//  SpaceAge.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/18/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

struct SpaceAge {
    // The period of the planet orbit in seconds
    enum PlanetOrbitalPeriod : Double {
        case Earth = 31557600
        case Mercury = 7600543.81992
        case Venus = 19414149.052176
        case Mars = 59354032.69008
        case Jupiter = 374355659.124
        case Saturn = 929292362.8848
        case Uranus = 2651370019.3296
        case Neptune = 5200418560.032
    }
    
    var ageInSeconds: Int
    
    init(_ ageInSeconds: Int) {
        self.ageInSeconds = ageInSeconds
    }

    var seconds: Int { return self.ageInSeconds }
    var on_earth: Double { return planetAge(.Earth) }
    var on_mercury: Double { return planetAge(.Mercury) }
    var on_venus: Double { return planetAge(.Venus) }
    var on_mars: Double { return planetAge(.Mars) }
    var on_jupiter: Double { return planetAge(.Jupiter) }
    var on_saturn: Double { return planetAge(.Saturn) }
    var on_uranus: Double { return planetAge(.Uranus) }
    var on_neptune: Double { return planetAge(.Neptune) }
    
    private func planetAge(planet: PlanetOrbitalPeriod) -> Double {
        let convertedNumber = Double(self.ageInSeconds) / Double(planet.rawValue)
        return roundTwoDecimalPlaces(convertedNumber)
    }
    
    private func roundTwoDecimalPlaces(number: Double) -> Double {
        return Double(round(100*number)/100)
    }
    
}