//
//  main.swift
//  PermutationEquationProblem
//
//  Created by Andrew Vasiliev on 10.03.2021.
//

// https://www.hackerrank.com/challenges/permutation-equation/problem

import Foundation

// Complete the permutationEquation function below.
func permutationEquation(p: [Int]) -> [Int] {
    let dict = Dictionary(uniqueKeysWithValues: zip(p, 1...p.count))

    return (1...p.count)
        .compactMap { return dict[$0] }
        .compactMap { return dict[$0] }
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let pTemp = readLine() else { fatalError("Bad input") }
let p: [Int] = pTemp.split(separator: " ").map {
    if let pItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return pItem
    } else { fatalError("Bad input") }
}

guard p.count == n else { fatalError("Bad input") }

let result = permutationEquation(p: p)
print(result)

//fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
