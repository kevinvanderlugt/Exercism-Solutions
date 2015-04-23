//
//  Wordy.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 4/22/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

class WordProblem {
    var message: String
    init(_ message: String) {
        self.message = message
    }
    
    enum Op {
        case Operand(Int)
        case Operation((Int, Int) -> Int)
    }
    
    let operations = [
        "plus": Op.Operation { $0 + $1 },
        "minus": Op.Operation { $0 - $1 },
        "multiplied": Op.Operation { $0 * $1 },
        "divided": Op.Operation { $0 / $1 }
    ]
    
    var answer: Int? {
        var ops = [Op]()
        
        let components = message[0..<message.length-1].componentsSeparatedByString(" ")
        for component in components {
            if let number = component.toInt() {
                ops.append(Op.Operand(number))
            } else if let op = operations[component.lowercaseString] {
                ops.append(op)
            }
        }
        return evaluateOps(ops)
    }
    
    private func evaluateOps(ops: [Op]) -> Int? {
        if ops.count < 2 { return nil }
        
        var result: Int?
        for (index, op) in enumerate(ops) {
            switch op {
            case .Operand(let operand):
                if result == nil {
                    result = operand
                }
            case .Operation(let operation):
                if index+1 == ops.count { return nil }
                if let nextOperand = value(ops[index+1]) {
                    if result != nil {
                        result = operation(result!, nextOperand)
                    }
                }
            default:
                break
            }
        }
        return result
    }
    
    private func value(op: Op) -> Int? {
        switch op {
        case .Operand(let result):
            return result
        default:
            return nil
        }
    }
}

extension String {
    var length: Int { return count(self) }

    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
    }
}