//
//  main.swift
//  MagicSquareFormingProblem
//
//  Created by Andrew Vasiliev on 03.03.2021.
//

// https://www.hackerrank.com/challenges/magic-square-forming/problem

import Foundation

// Complete the formingMagicSquare function below.
func formingMagicSquare(s: [[Int]]) -> Int {
    let magicSquare1: [[Int]] = [[4, 9, 2], [3, 5, 7], [8, 1, 6]]
    let magicSquare2: [[Int]] = magicSquare1.reversed()
    let magicSquare3: [[Int]] = magicSquare1.map { $0.reversed() }
    let magicSquare4: [[Int]] = magicSquare2.map { $0.reversed() }
    let magicSquare5: [[Int]] = [[2, 7, 6], [9, 5, 1], [4, 3, 8]]
    let magicSquare6: [[Int]] = magicSquare5.reversed()
    let magicSquare7: [[Int]] = magicSquare5.map { $0.reversed() }
    let magicSquare8: [[Int]] = magicSquare6.map { $0.reversed() }

    return [
        magicSquare1,
        magicSquare2,
        magicSquare3,
        magicSquare4,
        magicSquare5,
        magicSquare6,
        magicSquare7,
        magicSquare8,
    ]
        .map { return findDiff(firstArray: $0, secondArray: s) }
        .min() ?? 0
}

func findDiff(firstArray: [[Int]], secondArray: [[Int]]) -> Int {
    return zip(
        firstArray.flatMap { return $0 },
        secondArray.flatMap { return $0 }
    )
    .map {
        return abs($0.0 - $0.1)
    }
    .reduce(0, +)
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

let s: [[Int]] = AnyIterator{ readLine() }.prefix(3).map {
    let sRow: [Int] = $0.split(separator: " ").map {
        if let sItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return sItem
        } else { fatalError("Bad input") }
    }

    guard sRow.count == 3 else { fatalError("Bad input") }

    return sRow
}

guard s.count == 3 else { fatalError("Bad input") }

let result = formingMagicSquare(s: s)
print(result)

//fileHandle.write(String(result).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
