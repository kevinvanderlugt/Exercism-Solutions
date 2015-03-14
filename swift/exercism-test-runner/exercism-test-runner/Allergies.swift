//
//  Allergies.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/14/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

struct Allergies {
    static let eggs: UInt   = 1 << 0,
        peanuts: UInt       = 1 << 1,
        shellfish: UInt     = 1 << 2,
        strawberries: UInt  = 1 << 3,
        tomatoes: UInt      = 1 << 4,
        chocolate: UInt     = 1 << 5,
        pollen: UInt        = 1 << 6,
        cats: UInt          = 1 << 7
    
    private var score: UInt
    init(_ score: UInt) {
        self.score = score
    }
    
    func hasAllergy(allergy: UInt) -> Bool {
        return allergy & score > 0
    }
}