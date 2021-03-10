//
//  main.swift
//  StrangeAdvertisingProblem
//
//  Created by Andrew Vasiliev on 09.03.2021.
//

// https://www.hackerrank.com/challenges/strange-advertising/problem

import Foundation

// Complete the viralAdvertising function below.
func viralAdvertising(n: Int) -> Int {
    var sharedCount = 5

    return (0..<n)
        .reduce(0) { result, _ in
            let liked = sharedCount / 2
            sharedCount = liked * 3

            return result + liked
        }
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = viralAdvertising(n: n)
print(result)

//fileHandle.write(String(result).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
