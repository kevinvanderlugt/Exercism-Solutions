//
//  Binary.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/23/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

struct Binary {
    var binaryString: String
    
    init(_ binaryString: String){
        self.binaryString = binaryString
    }
    
    var toDecimal: Int {
        var binary = 0
        for (index, num) in enumerate(reverse(binaryString)) {
            if let bit = String(num).toInt() {
                if( bit < 0 || bit > 1) { return 0 }
                binary += (String(num).toInt() ?? 0) * Int(pow(2.0, Double(index)))
            } else {
                return 0
            }
        }
        return binary
    }
}