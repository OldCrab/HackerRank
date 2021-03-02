import Foundation



/*
 * Complete the 'possibleChanges' function below.
 *
 * The function is expected to return a STRING_ARRAY.
 * The function accepts STRING_ARRAY usernames as parameter.
 */

func wordCanBeSmaller(_ word: String) -> Bool {
    guard var min = word.first else { return false }

    for char in word {
        if char < min {
            min = char
        } else if char > min {
            return true
        }
    }

    return false
}


func possibleChanges(usernames: [String]) -> [String] {
    // Write your code here

    let canBeSmaller = usernames.map { wordCanBeSmaller($0) }

    print(canBeSmaller)

    return ["YES"]
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let usernamesCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var usernames = [String]()

for _ in 1...usernamesCount {
    guard let usernamesItem = readLine() else { fatalError("Bad input") }

    usernames.append(usernamesItem)
}

guard usernames.count == usernamesCount else { fatalError("Bad input") }

let result = possibleChanges(usernames: usernames)

fileHandle.write(result.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
