//
//  Accumulate.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/15/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

extension Array {
    func accumulate<U>(transform: (T) -> U) -> [U] {
        var accumulatedArray = [U]()
        for object in self {
            accumulatedArray.append(transform(object))
        }
        return accumulatedArray
    }
}
