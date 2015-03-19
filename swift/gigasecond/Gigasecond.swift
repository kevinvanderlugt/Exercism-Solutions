//
//  Gigasecond.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/19/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

struct Gigasecond {
    static func from(birthday: String) -> NSDate {
        let gigasecond = pow(10.0, 9.0)
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let birthdate = dateFormatter.dateFromString(birthday) {
            return birthdate.dateByAddingTimeInterval(gigasecond)
        }
        return NSDate.distantFuture() as NSDate
    }
}