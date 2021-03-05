//
//  main.swift
//  ClimbingTheLeaderboardProblem
//
//  Created by Andrew Vasiliev on 04.03.2021.
//

// https://www.hackerrank.com/challenges/climbing-the-leaderboard/problem

import Foundation

/*
 * Complete the 'climbingLeaderboard' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts following parameters:
 *  1. INTEGER_ARRAY ranked
 *  2. INTEGER_ARRAY player
 */

func climbingLeaderboard(ranked: [Int], player: [Int]) -> [Int] {
    // Write your code here
    let leaderboard = makeLeaderboard(ratings: ranked)

    var currentLastPlace = ranked.count - 1

    return player.map {
        while ranked[currentLastPlace] < $0 {
            guard currentLastPlace > 0 else { return 1 }

            currentLastPlace -= 1
        }

        let competitorsPlace = leaderboard[currentLastPlace]

        return ranked[currentLastPlace] == $0 ? competitorsPlace : competitorsPlace + 1
    }
}

func makeLeaderboard(ratings: [Int]) -> [Int] {
    var currentRank = 1
    var currentRating = ratings.first

    return ratings.map { rating in
        if currentRating != rating {
            currentRating = rating
            currentRank += 1
        }

        return currentRank
    }
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let rankedCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let rankedTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let ranked: [Int] = rankedTemp.split(separator: " ").map {
    if let rankedItem = Int($0) {
        return rankedItem
    } else { fatalError("Bad input") }
}

guard ranked.count == rankedCount else { fatalError("Bad input") }

guard let playerCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let playerTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let player: [Int] = playerTemp.split(separator: " ").map {
    if let playerItem = Int($0) {
        return playerItem
    } else { fatalError("Bad input") }
}

guard player.count == playerCount else { fatalError("Bad input") }

let result = climbingLeaderboard(ranked: ranked, player: player)

//fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
