//
//  main.swift
//  CatsAndAMouseProblem
//
//  Created by Andrew Vasiliev on 03.03.2021.
//

// https://www.hackerrank.com/challenges/cats-and-a-mouse/problem

import Foundation

// Complete the catAndMouse function below.
//int x: Cat A's position
//int y: Cat B's position
//int z: Mouse's position

func catAndMouse(x: Int, y: Int, z: Int) -> String {
    let catADistance = abs(x - z)
    let catBDistance = abs(y - z)

    if catADistance > catBDistance {
        return "Cat B"
    } else if catADistance == catBDistance {
        return "Mouse C"
    } else {
        return "Cat A"
    }
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for _ in 1...q {
    guard let xyzTemp = readLine() else { fatalError("Bad input") }
    let xyz = xyzTemp.split(separator: " ").map{ String($0) }

    guard let x = Int(xyz[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    guard let y = Int(xyz[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    guard let z = Int(xyz[2].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    let result = catAndMouse(x: x, y: y, z: z)

    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
