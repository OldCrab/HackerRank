//
//  main.swift
//  AngryProfessorProblem
//
//  Created by Andrew Vasiliev on 09.03.2021.
//

// https://www.hackerrank.com/challenges/angry-professor/problem

import Foundation

// Complete the angryProfessor function below.
// We can do it by filter, but then we should go though all array
func angryProfessor(k: Int, a: [Int]) -> String {
    var currentTimelyStudentsCount = 0

    for studentTime in a {
        if studentTime <= 0 {
            currentTimelyStudentsCount += 1
        }

        if currentTimelyStudentsCount >= k  {
            return "NO"
        }
    }

    return "YES"
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for _ in 1...t {
    guard let nkTemp = readLine() else { fatalError("Bad input") }
    let nk = nkTemp.split(separator: " ").map{ String($0) }

    guard let n = Int(nk[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    guard let k = Int(nk[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    guard let aTemp = readLine() else { fatalError("Bad input") }
    let a: [Int] = aTemp.split(separator: " ").map {
        if let aItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return aItem
        } else { fatalError("Bad input") }
    }

    guard a.count == n else { fatalError("Bad input") }

    let result = angryProfessor(k: k, a: a)
    print(result)

//    fileHandle.write(result.data(using: .utf8)!)
//    fileHandle.write("\n".data(using: .utf8)!)
}
