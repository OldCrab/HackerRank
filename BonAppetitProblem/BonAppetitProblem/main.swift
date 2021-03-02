//
//  main.swift
//  BonAppetitProblem
//
//  Created by Andrew Vasiliev on 02.03.2021.
//

// https://www.hackerrank.com/challenges/bon-appetit/problem

import Foundation

// Complete the bonAppetit function below.
func bonAppetit(bill: [Int], k: Int, b: Int) -> Void {
    let togetherBill = bill
        .enumerated()
        .map { $0.offset == k ? 0 : $0.element }
        .reduce(0, +)

    let diff = b - togetherBill / 2

    print(diff == 0 ? "Bon Appetit" : "\(diff)")
}

guard let nkTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let nk = nkTemp.split(separator: " ").map{ String($0) }

guard let n = Int(nk[0])
else { fatalError("Bad input") }

guard let k = Int(nk[1])
else { fatalError("Bad input") }

guard let billTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let bill: [Int] = billTemp.split(separator: " ").map {
    if let billItem = Int($0) {
        return billItem
    } else { fatalError("Bad input") }
}

guard bill.count == n else { fatalError("Bad input") }

guard let b = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

bonAppetit(bill: bill, k: k, b: b)
