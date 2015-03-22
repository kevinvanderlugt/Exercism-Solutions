//
//  Scrabble.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/22/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

struct Scrabble {
    var word: String?
    
    init(_ word: String?) {
        self.word = word
    }
    
    var score: Int {
        if let word = self.word {
            return Scrabble.calculateScore(word)
        }
        return 0
    }
    
    static func score(word: String) -> Int {
        return calculateScore(word)
    }
    
    private static func calculateScore(word: String) -> Int {
        let uppercaseWord = word.uppercaseString
        let score = reduce(uppercaseWord, 0, { $0 + self.letterScore($1) })
        return score
    }
    
    static func letterScore(letter: Character) -> Int {
        switch letter {
            case "A", "E", "I", "O", "U", "L", "N", "R", "S", "T": return 1
            case "D", "G": return 2
            case "B", "C", "M", "P": return 3
            case "F", "H", "V", "W", "Y": return 4
            case "K": return 5
            case "J", "X": return 8
            case "Q", "Z": return 10
            default: return 0
        }
    }
}