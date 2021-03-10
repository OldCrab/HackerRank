//
//  main.swift
//  BeautifulDaysAtTheMoviesProblem
//
//  Created by Andrew Vasiliev on 09.03.2021.
//

import Foundation

// Complete the beautifulDays function below.
func beautifulDays(i: Int, j: Int, k: Int) -> Int {
    return (i...j).reduce(0) { result, number in
        var numberCopy = number

        var reversedNumber = 0

        while numberCopy > 0 {
            let r = numberCopy % 10
            reversedNumber = reversedNumber * 10 + r
            numberCopy /= 10
        }

        let remainder = (number - reversedNumber) % k

        return remainder == 0 ? result + 1 : result
    }
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let ijkTemp = readLine() else { fatalError("Bad input") }
let ijk = ijkTemp.split(separator: " ").map{ String($0) }

guard let i = Int(ijk[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let j = Int(ijk[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let k = Int(ijk[2].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

let result = beautifulDays(i: i, j: j, k: k)
print(result)
//fileHandle.write(String(result).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)

