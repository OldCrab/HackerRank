//
//  main.swift
//  DivisibleSumPairsProblem
//
//  Created by Andrew Vasiliev on 02.03.2021.
//

// https://www.hackerrank.com/challenges/divisible-sum-pairs/problem

import Foundation

// Complete the divisibleSumPairs function below.
func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
    let remainders = ar.map { $0 % k }

    var dict: [Int: Int] = remainders.reduce(into: [:]) { result, value in
        result[value, default: 0] += 1
    }

    let result = remainders.reduce(0) { result, remainder in
        dict[remainder, default: 0] -= 1
        return result + dict[(k - remainder) % k, default: 0]
    }

    return result
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

guard let arTemp = readLine() else { fatalError("Bad input") }
let ar: [Int] = arTemp.split(separator: " ").map {
    if let arItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arItem
    } else { fatalError("Bad input") }
}

guard ar.count == n else { fatalError("Bad input") }

let result = divisibleSumPairs(n: n, k: k, ar: ar)

//fileHandle.write(String(result).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
