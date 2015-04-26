//
//  Tournament.swift
//  exercism-test-runner
//
//  Created by Kevin VanderLugt on 4/23/15.
//  Copyright (c) 2015 Alpine Pipeline, LLC. All rights reserved.
//

import Foundation

class Tournament {
    init() { }
    
    enum Statistic : String {
        case MatchesPlayed = "MP"
        case Win = "W"
        case Draw = "D"
        case Loss = "L"
    }
    
    private var results = [String: [Statistic: Int]]()
    
    func tally(input: String) -> String {
        parseInput(input)
        return ""
//        let scores
    }
    
    private let matchSeperator = "\n"
    private let teamSeperator = ";"
    private func parseInput(input: String) {
        let matches = input.componentsSeparatedByString(matchSeperator)
        for match in matches {
            let components = match.componentsSeparatedByString(teamSeperator)
            if(components.count == 3) {
                let firstTeam = components[0]
                let secondTeam = components[1]
                switch components[2] {
                case "win":
                    incrementStatistic(firstTeam, statistic: .Win)
                    incrementStatistic(secondTeam, statistic: .Loss)
                case "loss":
                    incrementStatistic(firstTeam, statistic: .Loss)
                    incrementStatistic(secondTeam, statistic: .Win)
                case "draw":
                    incrementStatistic(firstTeam, statistic: .Draw)
                    incrementStatistic(secondTeam, statistic: .Draw)
                default:
                    break
                }
                
                incrementStatistic(firstTeam, statistic: .MatchesPlayed)
                incrementStatistic(secondTeam, statistic: .MatchesPlayed)
            }
        }
    }
    
    private func teamStatistics(teamname: String) -> [Statistic: Int] {
        return results[teamname] ?? [Statistic: Int]()
    }
    
    private func incrementStatistic(team: String, statistic: Statistic) {
        var teamStats = teamStatistics(team)
        teamStats[statistic] = (teamStats[statistic] ?? 0) + 1
        results[team] = teamStats
    }
}