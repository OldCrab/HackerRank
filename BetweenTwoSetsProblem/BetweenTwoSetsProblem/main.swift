//
//  main.swift
//  BetweenTwoSetsProblem
//
//  Created by Andrew Vasiliev on 01.03.2021.
//

// https://www.hackerrank.com/challenges/between-two-sets/problem

import Foundation

func getTotalX(a: [Int], b: [Int]) -> Int {
    // Write your code here
    let firstArrayLcm = find(array: a, reducingFunc: findLCM)
    let secondArrayGcd = find(array: b, reducingFunc: findGCD)

    var possibleValues: [Int] = []

    for possibleValue in stride(from: firstArrayLcm, through: secondArrayGcd, by: firstArrayLcm) {
        if secondArrayGcd % possibleValue == 0 {
            possibleValues.append(possibleValue)
        }
    }

    return possibleValues.count
}

func find(array: [Int], reducingFunc: (Int, Int) -> Int) -> Int {
    guard let firstElement = array.first else { return 1 }

    return array.reduce(into: firstElement) { result, value in
        result = reducingFunc(max(result, value), min(result, value))
    }
}

func findGCD(a: Int, b: Int) -> Int {
    let gcd = a % b

    return gcd == 0 ? b : findGCD(a: b, b: gcd)
}

func findLCM(a: Int, b: Int) -> Int {
    let gcd = findGCD(a: a, b: b)

    return (a * b) / gcd
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let n = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let m = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

guard let brrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let brr: [Int] = brrTemp.split(separator: " ").map {
    if let brrItem = Int($0) {
        return brrItem
    } else { fatalError("Bad input") }
}

guard brr.count == m else { fatalError("Bad input") }

let total = getTotalX(a: arr, b: brr)

//fileHandle.write(String(total).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
//2 3
//
//2 4
//
//16 32 96
