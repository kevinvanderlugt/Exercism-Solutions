//
//  Trinary.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 4/1/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

infix operator ** { }
func ** (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

struct Trinary {
    var trinaryNumbers: String
    
    init(_ numbers: String){
        self.trinaryNumbers = numbers
    }
    
    var toDecimal: Int {
        var decimal: Int = 0
        for (index, trinary) in enumerate(reverse(trinaryNumbers)) {
            if let digit = String(trinary).toInt() {
                decimal += digit*(3**index)
            }
        }
        return decimal
    }
}