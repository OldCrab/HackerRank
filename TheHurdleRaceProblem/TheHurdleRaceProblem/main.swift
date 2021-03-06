//
//  main.swift
//  TheHurdleRaceProblem
//
//  Created by Andrew Vasiliev on 05.03.2021.
//

// https://www.hackerrank.com/challenges/the-hurdle-race/problem

import Foundation

// Complete the hurdleRace function below.
func hurdleRace(k: Int, height: [Int]) -> Int {
    let maxHeight = height.max() ?? 0

    return max(maxHeight - k, 0)
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let nkTemp = readLine() else { fatalError("Bad input") }
let nk = nkTemp.split(separator: " ").map{ String($0) }

guard let n = Int(nk[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let k = Int(nk[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let heightTemp = readLine() else { fatalError("Bad input") }
let height: [Int] = heightTemp.split(separator: " ").map {
    if let heightItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return heightItem
    } else { fatalError("Bad input") }
}

guard height.count == n else { fatalError("Bad input") }

let result = hurdleRace(k: k, height: height)

//fileHandle.write(String(result).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
