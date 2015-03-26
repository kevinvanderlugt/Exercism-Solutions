//
//  Atbash.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/26/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

struct Atbash {
    static let minCharacterValue = Int(UnicodeScalar("a").value)
    static let maxCharacterValue = Int(UnicodeScalar("z").value)
    
    static func encode(input: String) -> String {
        let sanitizedInput = self.sanitized(input)
        var cipher = ""
        for (index, letter) in enumerate(sanitizedInput.unicodeScalars) {
            cipher += self.atbash(letter)
            if((index+1) % 5 == 0) { cipher += " " }
        }
        return cipher.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    static private func atbash(character: UnicodeScalar) -> String {
        let charValue = Int(character.value)
        if( charValue >= minCharacterValue && charValue <= maxCharacterValue) {
            let cipherValue = abs(charValue - maxCharacterValue) + minCharacterValue
            return String(UnicodeScalar(cipherValue))
        }
        return String(character)
    }
    
    static private func sanitized(input: String) -> String {
        let allowedCharacterSet = NSCharacterSet.alphanumericCharacterSet()
        let components = input.lowercaseString.componentsSeparatedByCharactersInSet(allowedCharacterSet.invertedSet)
        
        return join("", components.filter { $0 != "" })
    }
}