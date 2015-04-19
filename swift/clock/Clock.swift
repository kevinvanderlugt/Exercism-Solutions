//
//  Clock.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 4/19/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

class Clock : Printable {
    let hoursInDay = 24
    let minutesInHour = 60
    
    private var hours: Int {
        didSet {
            self.hours = hours % hoursInDay
            if hours < 0 {
                self.hours = hoursInDay + hours
            }
        }
    }
    private var minutes: Int {
        didSet {
            self.hours += minutes / minutesInHour
            self.minutes = minutes % minutesInHour
            if self.minutes < 0 {
                self.hours -= 1
                self.minutes = minutesInHour + minutes
            }
        }
    }
    
    init(hours: Int, minutes: Int) {
        self.hours = hours
        self.minutes = minutes
    }
    
    convenience init(hours: Int) {
        self.init(hours: hours, minutes: 0)
    }
    
    func add(#minutes: Int) -> Clock {
        self.minutes += minutes
        return self
    }
    
    func subtract(#minutes: Int) -> Clock {
        self.minutes -= minutes
        return self
    }
}

// MARK: Clock Printable
extension Clock : Printable {
    var description: String {
        return "\(formattedTimeSegement(hours)):\(formattedTimeSegement(minutes))"
    }
    private func formattedTimeSegement(segment: Int) -> String {
        return String(format: "%02d", segment)
    }
}

// MARK: Clock Equatable
extension Clock : Equatable {}
func ==(lhs: Clock, rhs: Clock) -> Bool {
    return lhs.description == rhs.description
}

// MARK: Clock Comparable
extension Clock: Comparable {}
func <(lhs: Clock, rhs: Clock) -> Bool {
    let left = (lhs.hours * lhs.minutesInHour) + lhs.minutes
    let right = (rhs.hours * lhs.minutesInHour) + rhs.minutes
    return left < right
}

extension String {
    init(_ clock: Clock) {
        self.init(clock.description)
    }
}