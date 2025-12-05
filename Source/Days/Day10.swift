import Foundation

struct Day10Solver: DailySolver {
    public typealias CalculationInput = [Int]
    
    public func parseInput(_ input: String) -> CalculationInput {
        let inputLines = input.components(separatedBy: "\n")
        let convertedInput = inputLines.compactMap(Int.init)
        
        return convertedInput
    }
    
    public func calculatePart1(_ input: CalculationInput) -> Int? {
        return nil
    }
    
    public func calculatePart2(_ input: CalculationInput) -> Int? {
        return nil
    }
}

//MARK: - Inputs
public let day10Inputs = DailyPuzzleInputs(
    part1Example: testInputString,
    part1ExampleAnswer: nil,
    part2ExampleAnswer: nil,
    puzzleInput: puzzleInputString
)

fileprivate let testInputString = """
"""

fileprivate let puzzleInputString = """
"""
