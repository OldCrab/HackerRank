//
//  main.swift
//  DrawingBookProblem
//
//  Created by Andrew Vasiliev on 02.03.2021.
//

// https://www.hackerrank.com/challenges/drawing-book/problem

import Foundation

/*
 * Complete the pageCount function below.
 */
func pageCount(n: Int, p: Int) -> Int {
    return min(p / 2, n / 2 - p / 2)
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let p = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

let result = pageCount(n: n, p: p)

print(result)
//fileHandle.write(String(result).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)

