//
//  main.swift
//  SockMerchantProblem
//
//  Created by Andrew Vasiliev on 02.03.2021.
//

// https://www.hackerrank.com/challenges/sock-merchant/problem

import Foundation

// Complete the sockMerchant function below.
func sockMerchant(n: Int, ar: [Int]) -> Int {
    var setOfOddSocks: Set<Int> = []

    return ar.reduce(0) { result, sock in
        guard setOfOddSocks.remove(sock) == nil else { return result + 1 }

        setOfOddSocks.insert(sock)

        return result
    }
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arTemp = readLine() else { fatalError("Bad input") }
let ar: [Int] = arTemp.split(separator: " ").map {
    if let arItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arItem
    } else { fatalError("Bad input") }
}

guard ar.count == n else { fatalError("Bad input") }

let result = sockMerchant(n: n, ar: ar)
print(result)
//fileHandle.write(String(result).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
