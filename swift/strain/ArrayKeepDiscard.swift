//
//  ArrayKeepDiscard.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/25/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

extension Array {
    func keep(predicate: (T) -> Bool, comparator: Bool = true) -> Array {
        var newArray: Array = []
        for object in self {
            if(predicate(object) == comparator) {
                newArray.append(object)
            }
        }
        return newArray
    }
    
    func discard(predicate: (T) -> Bool) -> Array {
        return keep(predicate, comparator: false)
    }
}