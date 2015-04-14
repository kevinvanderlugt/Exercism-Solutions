//
//  PigLatin.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 4/12/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

class PigLatin {
    static let vowelCharacterSet = NSCharacterSet(charactersInString: "aeiou")
    static let edgeCasePrefix = ["yt", "xr"]
    static let ending = "ay"
    
    class func translate(word: String) -> String {
        return " ".join(word.componentsSeparatedByString(" ").map { self.translateSingleWord($0) } )
    }
    
    class func translateSingleWord(word: String) -> String {
        var response = word.lowercaseString
        
        let isEdgeCase = edgeCasePrefix.reduce(false, combine: {
            let prefix = $1
            return $0 || word.hasPrefix(prefix) }
        )
        
        if(!isEdgeCase) {
            for letter in word {
                if !vowelCharacterSet.containsCharacter(letter) ||
                    (letter == "u") && response.hasSuffix("q") {
                    response = dropFirst(response) + "\(letter)"
                } else {
                    break
                }
            }
        }
        response += ending
        return response
    }
}

extension NSCharacterSet {
    func containsCharacter(char: Character) -> Bool {
        let s = String(char)
        return s.rangeOfCharacterFromSet(self, options: nil, range: s.startIndex..<s.endIndex) != nil
    }
}