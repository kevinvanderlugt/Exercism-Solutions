//
//  Gigasecond.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/19/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

infix operator ** {}
func ** (num: Double, power: Double) -> Double{
    return pow(num, power)
}

struct Gigasecond {
    static let gigasecond: NSTimeInterval = { return NSTimeInterval(10**9) }()
    
    static func from(birthday: String) -> NSDate {
        var dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let birthdate = dateFormatter.dateFromString(birthday)!
        return birthdate.dateByAddingTimeInterval(gigasecond)
    }
}