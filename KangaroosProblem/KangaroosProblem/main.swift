//
//  main.swift
//  KangaroosProblem
//
//  Created by Andrew Vasiliev on 01.03.2021.
//

// https://www.hackerrank.com/challenges/kangaroo/problem

import Foundation

// Complete the kangaroo function below.
func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    let speedDiff = v1 - v2
    let distanceDiff = x1 - x2

    guard distanceDiff != 0 else { return "YES" }
    guard speedDiff != 0 else { return "NO" }
    guard distanceDiff.signum() != speedDiff.signum() else { return "NO" }

    return (x1 - x2) % (v1 - v2) == 0 ? "YES" : "NO"
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let x1V1X2V2Temp = readLine() else { fatalError("Bad input") }
let x1V1X2V2 = x1V1X2V2Temp.split(separator: " ").map{ String($0) }

guard let x1 = Int(x1V1X2V2[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let v1 = Int(x1V1X2V2[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let x2 = Int(x1V1X2V2[2].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let v2 = Int(x1V1X2V2[3].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

let result = kangaroo(x1: x1, v1: v1, x2: x2, v2: v2)
print(result)
//fileHandle.write(result.data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
