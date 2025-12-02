import Foundation

struct Day4Solver: DailySolver {
    public typealias CalculationInput = [Int]
    
    public func parseInput(_ input: String) -> CalculationInput {
        let inputLines = input.components(separatedBy: "\n")
        return inputLines.compactMap(Int.init)
    }
    
    public func calculatePart1(_ input: CalculationInput) -> Int? {
        // Part 1 calculation here

        return nil
    }
    
    public func calculatePart2(_ input: CalculationInput) -> Int? {
        // Part 2 calculation here

        return nil
    }
}

//MARK: - Inputs
public let day4Inputs = DailyPuzzleInputs(
    part1Example: testInputString,
    part1ExampleAnswer: nil,
    part2ExampleAnswer: nil,
    puzzleInput: puzzleInputString
)

fileprivate let testInputString = """
"""

fileprivate let puzzleInputString = """
"""
