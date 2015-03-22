//
//  RomanNumerals.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/22/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

extension Int {
    var toRoman: String {
        let romanNumerals: [Int: String] = [ 1: "I", 4: "IV", 5: "V", 9: "IX", 10: "X", 40: "XL", 50: "L",  90: "XC", 100: "C", 400: "CD", 500: "D", 900: "CM", 1000: "M" ]
        let sortedRomanNumerals = sorted(romanNumerals) { $0.0 > $1.0 }
        
        return sortedRomanNumerals.reduce(("", self), combine: { (remainderTuple, valueTuple) -> (String, Int) in
            var (romanString, remainder) = remainderTuple
            let (numeralConstant, romanNumeral) = valueTuple
            
            let characterCount = remainder / numeralConstant
            if(characterCount > 0) {
                remainder = remainder % numeralConstant
                romanString += String(count: characterCount, repeatedValue: romanNumeral)
            }
            
            return (romanString, remainder)
        }).0
    }
}

extension String {
    init(count: Int, repeatedValue value: String) {
        let array = Array(count: count, repeatedValue: value)
        self = "".join(array)
    }
}
