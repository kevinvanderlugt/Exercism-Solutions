//
//  LinkedList.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 4/22/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

class Node<T> {
    var next, previous: Node?
    var value: T
    
    init(value: T, next: Node?, previous: Node?) {
        self.next = next
        self.previous = previous
        self.value = value
    }
}

class Deque<T> {
    var first, last: Node<T>?
    init() { }
 
    func push(value: T) {
        let node = Node(value: value, next: nil, previous: last)
        if let last = last {
            last.next = node
        }
        if first == nil { first = node }
        last = node
    }
    
    func pop() -> T? {
        let poppedNode = last
        last?.previous?.next = nil
        last = last?.previous
        return poppedNode?.value
    }
    
    func shift() -> T? {
        if let node = first {
            first = node.next
            return node.value
        }
        return nil
    }
    
    func unshift(value: T) {
        let node = Node(value: value, next: first, previous: nil)
        if let first = first {
            first.previous = node
        }
        first = node
        if last == nil { last = node }
    }
}