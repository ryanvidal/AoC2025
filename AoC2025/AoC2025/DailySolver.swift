//
//  DailySolver.swift
//  AoC2021
//
//  Created by Ryan Vidal on 12/1/21.
//

import Foundation

public protocol DailySolver {
    associatedtype CalculationInput
    func parseInput(_ input: String) -> CalculationInput
    func calculatePart1(_ input: CalculationInput) -> Int?
    func calculatePart2(_ input: CalculationInput) -> Int?
}

public extension DailySolver {
    func checkPart1Example(_ input: String, against expectedValue: Int) -> String {
        guard let result = calculatePart1(parseInput(input)) else { return "No answer!" }
        return "\(result) \(expectedValue == result ? "✅" : "❌")"
    }
    func checkPart2Example(_ input: String, against expectedValue: Int) -> String {
        guard let result = calculatePart2(parseInput(input)) else { return "No answer!" }
        return "\(result) \(expectedValue == result ? "✅" : "❌")"
    }
    func getPart1ResultString(from stringInput: String) -> String {
        guard let result = calculatePart1(parseInput(stringInput)) else { return "No answer!" }
            return "\(result)"
        }
    
    func getPart2ResultString(from stringInput: String) -> String {
        guard let result = calculatePart2(parseInput(stringInput)) else { return "No answer!" }
        return "\(result)"
    }
}
