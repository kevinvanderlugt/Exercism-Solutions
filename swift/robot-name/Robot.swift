//
//  Robot.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/12/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

class Robot {
    private let uppercaseLetters = Array(65...90).map {String(UnicodeScalar($0))}
    
    private(set) var name: String!
    
    init() {
        resetName()
    }
    
    func resetName() {
        generateName()
    }
    
    private func generateName() {
        self.name = "\(randomLetter())\(randomLetter())\(randomNumber())\(randomNumber())\(randomNumber())"
    }
    
    private func randomLetter() -> String {
        let randomIndex = arc4random_uniform(UInt32(uppercaseLetters.count))
        return uppercaseLetters[Int(randomIndex)]
    }
    
    private func randomNumber() -> Int {
        return Int(arc4random_uniform(9))
    }
}