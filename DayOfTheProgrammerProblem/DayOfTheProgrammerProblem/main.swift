//
//  main.swift
//  DayOfTheProgrammerProblem
//
//  Created by Andrew Vasiliev on 02.03.2021.
//

// https://www.hackerrank.com/challenges/day-of-the-programmer/problem

import Foundation

// Complete the dayOfProgrammer function below.
func dayOfProgrammer(year: Int) -> String {
    let isJulianCalendarActual = isJulianCalendar(year: year)
    let isLeap = isLeapYear(year: year, isJulianCalendar: isJulianCalendarActual)

    var day = 13
    if isLeap {
        day -= 1
    }

    if year == 1918 {
        day += 13
    }

    return "\(day).09.\(year)"
}

func isLeapYear(year: Int, isJulianCalendar: Bool) -> Bool {
    return isJulianCalendar
        ? year % 4 == 0
        : year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
}

func isJulianCalendar(year: Int) -> Bool {
    return year < 1919
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let year = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = dayOfProgrammer(year: year)
print(result)

//fileHandle.write(result.data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
