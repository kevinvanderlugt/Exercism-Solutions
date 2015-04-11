//
//  Luhn.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 4/11/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//
struct Luhn {
    static let base = 10
    
    var number: Int
    init(_ number: Int) {
        self.number = number
    }
    
    private var numberComponents: [Int] {
        let numberArray = Array(String(number))
        return numberArray.map { String($0).toInt()! }
    }
    
    private var reversedComponents: [Int] {
        return reverse(numberComponents)
    }
    
    var addends: [Int] {
        return reverse(map(enumerate(reversedComponents)) { (index, number) in
            var doubled = number * 2
            doubled = doubled < Luhn.base ? doubled : doubled - (Luhn.base-1)
            return index % 2 == 0 ? number : doubled
        })
    }
    
    var checksum: Int {
        return addends.reduce(0, combine: +)
    }
    
    var isValid: Bool {
        return checksum % Luhn.base == 0
    }
    
    static func create(number: Int) -> Int {
        let luhn = self(number * base)
        let checkDigit = (base - luhn.checksum % base) % base
        return luhn.number + checkDigit
    }
}