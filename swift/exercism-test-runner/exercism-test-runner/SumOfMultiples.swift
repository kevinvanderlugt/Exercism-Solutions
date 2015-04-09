//
//  SumOfMultiples.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/15/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//
import Foundation

struct SumOfMultiples {
    static func toLimit(limit: Int, inMultiples: [Int] = [3,5]) -> Int {
        let filteredArray = Array(0..<limit).filter {
            self.isMultiple($0, ofMultiples: inMultiples)
        }
        let sum = filteredArray.reduce(0, combine: +)
        return sum
    }
    
    private static func isMultiple(number: Int, ofMultiples: [Int]) -> Bool {
        for multiple in ofMultiples {
            if(multiple == 0) { continue }
            
            if number % multiple == 0 { return true }
        }
        return false
    }
}