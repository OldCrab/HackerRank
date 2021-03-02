//
//  main.swift
//  test2
//
//  Created by Andrew Vasiliev on 25.02.2021.
//

import Foundation

func findPairsCount(withElementsCount elementsCount: Int) -> Int {
    return elementsCount == 0 ? 0 : (elementsCount - 1) + findPairsCount(withElementsCount: elementsCount - 1)
}

func nearlySimilarRectangles(sides: [[Int]]) -> Int {
    // Write your code here
    let ratios = sides.map { Double($0[0]) / Double($0[1]) }
    var ratiosCount: [Double : Int] = [:]

    ratios.forEach {
        if let thisRatioCount = ratiosCount[$0] {
            ratiosCount[$0] = thisRatioCount + 1
        } else {
            ratiosCount[$0] = 1
        }
    }

    let result = ratiosCount.values.reduce(0) { result, elementsCount in
        return result + findPairsCount(withElementsCount: elementsCount)
    }

    print(result)
    return 1
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let sidesRows = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let sidesColumns = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var sides = [[Int]]()

for _ in 1...sidesRows {
    guard let sidesRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let sidesRow: [Int] = sidesRowTemp.split(separator: " ").map {
        if let sidesItem = Int($0) {
            return sidesItem
        } else { fatalError("Bad input") }
    }

    guard sidesRow.count == sidesColumns else { fatalError("Bad input") }

    sides.append(sidesRow)
}

guard sides.count == sidesRows else { fatalError("Bad input") }

let result = nearlySimilarRectangles(sides: sides)

//fileHandle.write(String(result).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
