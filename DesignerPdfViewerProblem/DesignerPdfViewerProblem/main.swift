//
//  main.swift
//  DesignerPdfViewerProblem
//
//  Created by Andrew Vasiliev on 05.03.2021.
//

// https://www.hackerrank.com/challenges/designer-pdf-viewer/problem

import Foundation

// Complete the designerPdfViewer function below.
func designerPdfViewer(h: [Int], word: String) -> Int {
    let wordHeight = word
        .map { char in
            return (char.unicodeScalars.first?.value ?? 1) - Unicode.Scalar("a").value
        }
        .map(Int.init)
        .map { return h[$0] }
        .max()

    return (wordHeight ?? 0) * word.count
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let hTemp = readLine() else { fatalError("Bad input") }
let h: [Int] = hTemp.split(separator: " ").map {
    if let hItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return hItem
    } else { fatalError("Bad input") }
}

guard h.count == 26 else { fatalError("Bad input") }

guard let word = readLine() else { fatalError("Bad input") }

let result = designerPdfViewer(h: h, word: word)

print(result)
//fileHandle.write(String(result).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
