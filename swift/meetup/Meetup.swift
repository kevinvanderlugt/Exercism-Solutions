//
//  MeetUp.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 3/20/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

struct Meetup {
    var month: Int
    var year: Int
    
    let calendar = NSCalendar.currentCalendar()
    private let invalidDate = NSDate.distantFuture() as NSDate
    
    init(year: Int, month: Int) {
        self.year = year
        self.month = month
    }
    
    func day(day: Int, which: String) -> NSDate {
        let components = NSDateComponents()
        components.weekday = day
        
        var dateOptions = NSCalendarOptions.MatchNextTime
        var weeks = 0, dayOffset = 0, monthOffset = 0
        switch which {
        case "1st": weeks = 0
        case "2nd": weeks = 1
        case "3rd": weeks = 2
        case "4th": weeks = 3
        case "teenth": dayOffset = 12
        case "last":
            dayOffset = 1
            monthOffset = 1
            dateOptions = dateOptions | NSCalendarOptions.SearchBackwards
        default: return invalidDate
        }
        
        var returnDate = invalidDate
        if let startingDate = startDate(dayOffset: dayOffset, monthOffset: monthOffset) {
            var dateCount = 0
            calendar.enumerateDatesStartingAfterDate(startingDate, matchingComponents: components, options: dateOptions)
                { (date: NSDate!, exactMatch: Bool, stop: UnsafeMutablePointer<ObjCBool>) in
                    if dateCount == weeks {
                        stop.memory = true
                        returnDate = date
                    }
                    dateCount++
            }
        }
        return returnDate
    }
    
    func startDate(dayOffset: Int = 0, monthOffset: Int = 0) -> NSDate? {
        return calendar.dateWithEra(1,
            year: year,
            month: month + monthOffset,
            day: 0 + dayOffset,
            hour: 0, minute: 0, second: 0, nanosecond: 0)
    }
}