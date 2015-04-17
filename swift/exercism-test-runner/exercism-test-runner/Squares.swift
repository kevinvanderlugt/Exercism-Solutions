//
//  Squares.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 4/17/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

infix operator ** { }
func ** (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

class Squares {
    var count: Int
    init(_ count: Int) {
        self.count = count
    }
    
    var sumOfSquares: Int {
        return reduce(1...count, 0) { $0 + ($1**2) }
    }
    
    var squareOfSums: Int {
        return reduce(1...count, 0, +)**2
    }
    
    var differenceOfSquares: Int {
        return squareOfSums - sumOfSquares
    }
}