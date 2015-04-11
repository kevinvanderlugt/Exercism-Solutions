//
//  Octal.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 4/11/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//
//

import Foundation

infix operator ** { }
func ** (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

struct Octal {
    private let base = 8
    var octalNumbers: String
    
    init(_ octalNumbers: String) {
        self.octalNumbers = octalNumbers
    }
    
    var toDecimal: Int {
        
        var decimal: Int = 0
        if(validOctal) {
            for (index, trinary) in enumerate(reverse(octalNumbers)) {
                if let digit = String(trinary).toInt() {
                    decimal += digit*(base**index)
                }
            }
        }
        return decimal
    }
    
    private var validOctal: Bool {
        return filter(octalNumbers) { !contains(self.validNumbers, String($0)) }.isEmpty
    }
    
    private var validNumbers: [String] {
        return Array(0..<base).map({String($0)})
    }
}