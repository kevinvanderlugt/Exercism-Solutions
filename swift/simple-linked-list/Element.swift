//
//  Element.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 4/21/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

class Element<T> {
    var value: T?
    var next: Element?
    init() { }
    init(_ value: T, _ next: Element?) {
        self.value = value
        self.next = next
    }
    
    func toArray() -> [T] {
        var array = [T]()
        if let value = value {
            array.append(value)
            if let next = next {
                array += next.toArray()
            }
        }
        return array
    }
    
    class func fromArray(values: [T]) -> Element {
        var returnElement = Element()
        for value in values.reverse() {
            let newElement = Element(value, returnElement)
            returnElement = newElement
        }
        return returnElement
    }
    
    func reverseElements() -> Element {
        return Element.fromArray(self.toArray().reverse())
    }
}
