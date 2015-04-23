//
//  Series.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 4/11/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

class Series {
    let number: String
    init(_ number: String) {
        self.number = number
    }
    
    func slices(size: Int) -> [[Int]] {
        if(size > number.length) { return [] }
        
        var sliced = [[Int]]()
        let count = size - 1
        for (index, element) in enumerate(number) {
            if(index+count < number.length) {
                let startIndex = advance(index, 0)
                let endIndex = advance(index, count)
                let slice = number[startIndex...endIndex]
                let arraySlice = Array(slice)
                sliced.append(arraySlice.map { String($0).toInt()! })
            }
        }
        return sliced
    }
}

//extension String {
//    var length: Int { return count(self) }
//    
//    subscript (i: Int) -> Character {
//        return self[advance(self.startIndex, i)]
//    }
//    
//    subscript (r: Range<Int>) -> String {
//        return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
//    }
//}