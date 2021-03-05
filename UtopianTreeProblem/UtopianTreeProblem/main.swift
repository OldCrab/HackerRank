//
//  main.swift
//  UtopianTreeProblem
//
//  Created by Andrew Vasiliev on 05.03.2021.
//

// https://www.hackerrank.com/challenges/utopian-tree/problem

import Foundation

// Complete the utopianTree function below.
func utopianTree(n: Int) -> Int {
    return (0..<n).reduce(1) { result, seasonNumber in
        return seasonNumber % 2 == 0 ? result * 2 : result + 1
    }
}

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for _ in 1...t {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    let result = utopianTree(n: n)

    print(result)
}
