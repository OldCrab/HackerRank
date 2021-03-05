//
//  main.swift
//  CountingValleysProblem
//
//  Created by Andrew Vasiliev on 03.03.2021.
//

// https://www.hackerrank.com/challenges/counting-valleys/problem

import Foundation

/*
 * Complete the 'countingValleys' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER steps
 *  2. STRING path
 */

func countingValleys(steps: Int, path: String) -> Int {
    // Write your code here
    var currentHighUnits = 0
    var valeysCount = 0

    for step in path {
        switch step {
        case "U":
            currentHighUnits += 1

            if currentHighUnits == 0 {
                valeysCount += 1
            }
        case "D":
            currentHighUnits -= 1
        default:
            assertionFailure()
        }
    }

    return valeysCount
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let steps = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let path = readLine() else { fatalError("Bad input") }

let result = countingValleys(steps: steps, path: path)

//fileHandle.write(String(result).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
