//
//  Binary.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/23/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

struct Binary {
    var bits: String
    
    init(_ bits: String){
        self.bits = bits
    }
    
    var toDecimal: Int {
        var binary = 0
        for (index, bit) in enumerate(reverse(bits)) {
            if bit == "1" {
                binary += 0x1 << index
            } else if bit != "0" {
                return 0
            }
        }
        return binary
    }
}