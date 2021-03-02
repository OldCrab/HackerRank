//
//  main.swift
//  BreakingBestAndWorstRecordsProblem
//
//  Created by Andrew Vasiliev on 01.03.2021.
//

import Foundation

// Complete the breakingRecords function below.
func breakingRecords(scores: [Int]) -> [Int] {
    guard var max = scores.first, var min = scores.first else { return [0, 0] }

    var maxBreakes = 0
    var minBreakes = 0

    scores.forEach {
        if $0 > max {
            max = $0
            maxBreakes += 1
        } else if $0 < min {
            min = $0
            minBreakes += 1
        }
    }

    return [maxBreakes, minBreakes]
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let scoresTemp = readLine() else { fatalError("Bad input") }
let scores: [Int] = scoresTemp.split(separator: " ").map {
    if let scoresItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return scoresItem
    } else { fatalError("Bad input") }
}

guard scores.count == n else { fatalError("Bad input") }

let result = breakingRecords(scores: scores)

//fileHandle.write(result.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
