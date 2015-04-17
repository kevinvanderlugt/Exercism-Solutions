//
//  Pythagorean.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 4/15/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

infix operator ** { }
//func ** (radix: Int, power: Int) -> Int {
//    return Int(pow(Double(radix), Double(power)))
//}

class Triplet {
    var a, b, c: Int
    init(_ a:Int, _ b:Int, _ c:Int) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    var sum: Int {
        return a + b + c
    }
    
    var product: Int {
        return a * b * c
    }
    
    var isPythagorean: Bool {
        return ((a**2) + (b**2)) == (c**2)
    }
    
    class func Where(minFactor: Int = 1, maxFactor: Int, sum: Int = 0) -> [Triplet] {
        func validTriplet(sum: Int = 0, triplet: Triplet) -> Bool {
            return triplet.isPythagorean && (sum == 0 || sum == triplet.sum)
        }
        
        var triplets = Array(minFactor...maxFactor)
                        .combination(3)
                        .map { Triplet($0[0], $0[1], $0[2]) }
        return triplets.filter { validTriplet(sum: sum, $0) }
    }
}

extension Array {
    func combination(count: Int) -> [[T]] {
        return combos(self, count: count)
    }
    
    private func combos<T>(var array: [T], count: Int) -> [[T]] {
        if count == 0 {
            return [[]]
        }
        
        if array.isEmpty {
            return []
        }
        
        let head = [array[0]]
        let subcombos = combos(array, count: count - 1)
        var ret = subcombos.map {head + $0}
        array.removeAtIndex(0)
        ret += combos(array, count: count)
        
        return ret
    }
}
