//
//  SecretHandshake.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 4/18/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

class SecretHandshake {
    var number: Int
    init(_ number: Int) {
        self.number = number
    }

    private let allCommands = ["wink", "double blink", "close your eyes", "jump" ]
    private let reverseBit = 1 << 4

    var commands: [String] {
        var commands = [String]()
        for (index, command) in enumerate(allCommands) {
            if (number & 1 << index != 0) {
                commands.append(command)
            }
        }

        return shouldReverse ? reverse(commands) : commands
    }

    private var shouldReverse: Bool {
        return number & reverseBit != 0
    }
}