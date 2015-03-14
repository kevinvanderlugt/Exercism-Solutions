//
//  Allergies.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/14/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

struct Allergies {
    var score: UInt
    
    static let eggs:UInt = 1, peanuts:UInt = 2, shellfish:UInt = 4,
    strawberries:UInt = 8, tomatoes:UInt = 16, chocolate:UInt = 32,
    pollen:UInt = 64, cats:UInt = 128
    
    init(_ score: UInt) {
        self.score = score
    }
    
    func hasAllergy(allergy: UInt) -> Bool {
        return allergy & score > 0
    }
}