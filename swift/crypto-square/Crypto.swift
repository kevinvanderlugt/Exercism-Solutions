//
//  Crypto.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/26/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

class Crypto {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
    
    var normalizePlaintext: String {
        let allowedCharacterSet = NSCharacterSet.alphanumericCharacterSet()
        let components = message.lowercaseString.componentsSeparatedByCharactersInSet(allowedCharacterSet.invertedSet)
        return join("", components)
    }
    
    var size: Int {
        let squareRoot = ceil(sqrt(Double(countElements(normalizePlaintext))))
        return Int(squareRoot)
    }
    
    private var rows: Int {
        let stringLength = countElements(normalizePlaintext)
        return Int(ceil(Double(stringLength)/Double(size)))
    }
    
    var plaintextSegments: [String] {
        if(size == 0) { return [] }
        
        var segments = Array(count: rows, repeatedValue: "")
        for (index, character) in enumerate(normalizePlaintext) {
            let rowIndex = index / size
            segments[rowIndex] = segments[rowIndex] + String(character)
        }
        return segments
    }
    
    var ciphertext: String {
        return reduce(0..<size, "", { (text, index) in
            return text + reduce(self.plaintextSegments, "", { (wholeSegment, segment) in
                if(index < countElements(segment)) {
                    return wholeSegment + "\(segment[index])"
                }
                return wholeSegment
            })
        })
    }
    
    var normalizeCiphertext: String {
        return join(" ", ciphertext.splitEveryCharacter(rows)).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
}

extension String {
    subscript (i: Int) -> Character {
        return self[advance(self.startIndex, i)]
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
    }
    func splitEveryCharacter(count: Int) -> [String] {
        let stringLength = countElements(self)
        var wordArray = [String]()
        for split in 0...stringLength/count {
            let startIndex = advance(split*count, 0)
            var endIndex = advance(split*count, count)
            if(endIndex > stringLength) { endIndex = stringLength }
            wordArray.append(self[Range(start: startIndex, end: endIndex)])
        }
        return wordArray
    }
}