//
//  Nucleotide.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 4/6/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

struct Nucleotide {
    private let transcriptionDNAtoRNA = ["G":"C", "C":"G", "T":"A", "A":"U"]
    
    var sequence: String
    init(_ sequence: String) {
        self.sequence = sequence
    }
    
    var complementOfDNA: String {
        return reduce(sequence, "", { $0 + (self.transcriptionDNAtoRNA[String($1)] ?? "") })
    }
    
    var complementOfRNA: String {
        let transcription = transcriptionDNAtoRNA as NSDictionary
        return reduce(sequence, "",
            {
                if let dna = transcription.allKeysForObject(String($1)).first as? String {
                    return $0 + dna
                }
                return $0
            }
        )
    }
}