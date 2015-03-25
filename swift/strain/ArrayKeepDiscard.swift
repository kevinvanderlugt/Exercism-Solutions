//
//  ArrayKeepDiscard.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/25/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

extension Array {
    func keep<T>(predicate: (T) -> Bool) -> [T] {
        var newArray = [T]()
        for object in self {
            if let object = object as? T {
                if(predicate(object)) {
                    newArray.append(object)
                }
            }
        }
        return newArray
    }
    
    func discard<T>(predicate: (T) -> Bool) -> [T] {
        var newArray = [T]()
        for object in self {
            if let object = object as? T {
                if(!predicate(object)) {
                    newArray.append(object)
                }
            }
        }
        return newArray
    }
}