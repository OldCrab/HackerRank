//
//  main.swift
//  PickingNumbersProblem
//
//  Created by Andrew Vasiliev on 03.03.2021.
//

// https://www.hackerrank.com/challenges/picking-numbers/problem

import Foundation

/*
 * Complete the 'pickingNumbers' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts INTEGER_ARRAY a as parameter.
 */

func pickingNumbers(a: [Int]) -> Int {
    // Write your code here
    let frequencies = a.reduce(into: [:]) { result, value in
        result[value, default: 0] += 1
    }

    return frequencies.reduce(0) { result, keyValue in
        let biggerNumberSequenceLength = (frequencies[keyValue.key + 1] ?? 0) + keyValue.value
        let smallerNumberSequenceLength = (frequencies[keyValue.key - 1] ?? 0) + keyValue.value

        return max(result, max(biggerNumberSequenceLength, smallerNumberSequenceLength))
    }
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let aTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == n else { fatalError("Bad input") }

let result = pickingNumbers(a: a)

//fileHandle.write(String(result).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
