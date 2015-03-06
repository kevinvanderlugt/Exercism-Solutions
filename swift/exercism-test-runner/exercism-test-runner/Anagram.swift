//
//  Anagram.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/6/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

class Anagram {
    var word: String
    
    init(word: String) {
        self.word = word
    }

    func match(words: [String]) -> [String] {
        var matches = [String]()
        let sortedMatchWord = sortedWord(word.lowercaseString)
        
        matches = words.filter { $0.lowercaseString != self.word.lowercaseString &&
                                self.sortedWord($0.lowercaseString) == sortedMatchWord }
        
        return matches
    }
    
    func sortedWord(word: String) -> String {
        let wordArray = Array(word)
        return String(wordArray.sorted { $0 < $1 })
    }
}