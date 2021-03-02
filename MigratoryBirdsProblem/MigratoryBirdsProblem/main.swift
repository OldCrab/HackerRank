//
//  main.swift
//  MigratoryBirdsProblem
//
//  Created by Andrew Vasiliev on 02.03.2021.
//

// https://www.hackerrank.com/challenges/migratory-birds/problem

import Foundation

// Complete the migratoryBirds function below.
func migratoryBirds(arr: [Int]) -> Int {
    guard arr.count > 0 else { return 0 }

    let birdsFrequencies = arr.reduce(into: [:]) { result, birdType in
        result[birdType, default: 0] += 1
    }

    let result = birdsFrequencies.reduce(arr[0]) { result, keyValue in
        let currentBiggestFrequence = birdsFrequencies[result] ?? 0
        if
            currentBiggestFrequence < keyValue.value
            || (currentBiggestFrequence == keyValue.value && keyValue.key < result)
        {
            return keyValue.key
        } else {
            return result
        }
    }

    return result
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let arrCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == arrCount else { fatalError("Bad input") }

let result = migratoryBirds(arr: arr)
print(result)
//
//fileHandle.write(String(result).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
