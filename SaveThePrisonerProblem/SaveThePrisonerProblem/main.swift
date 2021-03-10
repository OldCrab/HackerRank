//
//  main.swift
//  SaveThePrisonerProblem
//
//  Created by Andrew Vasiliev on 09.03.2021.
//

import Foundation

// Complete the saveThePrisoner function below.
func saveThePrisoner(n: Int, m: Int, s: Int) -> Int {
    let prisonerNumber = (s - 1 + m - 1) % n

    return prisonerNumber + 1
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for _ in 1...t {
    guard let nmsTemp = readLine() else { fatalError("Bad input") }
    let nms = nmsTemp.split(separator: " ").map{ String($0) }

    guard let n = Int(nms[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    guard let m = Int(nms[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    guard let s = Int(nms[2].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    let result = saveThePrisoner(n: n, m: m, s: s)
    print(result)
//    fileHandle.write(String(result).data(using: .utf8)!)
//    fileHandle.write("\n".data(using: .utf8)!)
}
