//
//  Hamming.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 2/24/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

struct Hamming {
    static func compute(strand: String, against: String) -> Int? {
        if(strand.endIndex != against.endIndex) { return nil }
        
        let unmatchedElements = filter(Zip2(strand, against)) { pair in
            let (nuc1, nuc2) = pair
            return nuc1 != nuc2
        }
        return count(unmatchedElements)
    }
}
