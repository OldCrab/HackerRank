//
//  main.swift
//  Test3
//
//  Created by Andrew Vasiliev on 26.02.2021.
//

import Foundation

/*
 * Complete the 'numberOfWays' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts 2D_INTEGER_ARRAY roads as parameter.
 */

func numberOfWays(roads: [[Int]]) -> Int {
    // Write your code here

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let roadsRows = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let roadsColumns = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var roads = [[Int]]()

for _ in 1...roadsRows {
    guard let roadsRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let roadsRow: [Int] = roadsRowTemp.split(separator: " ").map {
        if let roadsItem = Int($0) {
            return roadsItem
        } else { fatalError("Bad input") }
    }

    guard roadsRow.count == roadsColumns else { fatalError("Bad input") }

    roads.append(roadsRow)
}

guard roads.count == roadsRows else { fatalError("Bad input") }

let result = numberOfWays(roads: roads)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
