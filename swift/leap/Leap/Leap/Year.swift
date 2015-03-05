//
//  Year.swift
//  Leap
//
//  Created by Kevin VanderLugt on 2/16/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

class Year {
    private let calendarYear: Int
    
    init(calendarYear: Int) {
        self.calendarYear = calendarYear
    }
    
    var isLeapYear: Bool {
        return isDivisibleBy(4) && (!isDivisibleBy(100) || isDivisibleBy(400))
    }
    
    func isDivisibleBy(number: Int) -> Bool {
        return calendarYear % number == 0
    }
}