import Foundation

public protocol DailySolver {
    associatedtype CalculationInput
    func parseInput(_ input: String) -> CalculationInput
    func calculatePart1(_ input: CalculationInput) -> Int?
    func calculatePart2(_ input: CalculationInput) -> Int?
    init()
}

public extension DailySolver {
    func result(of part: PuzzlePart, using inputs: DailyPuzzleInputs) -> Int? {
        if part.isInPart1 {
            return calculatePart1(parseInput(inputs.getInput(for: part)))
        } else {
            return calculatePart2(parseInput(inputs.getInput(for: part)))
        }
    }
    
    func resultString(of part: PuzzlePart, using inputs: DailyPuzzleInputs) -> String {
        guard let result = result(of: part, using: inputs) else { return "No answer!" }
        
        if let expectedValue = inputs.getExpectedValue(for: part) {
            return "\(result) \(expectedValue == result ? "✅" : "❌")"
        }
        
        return "\(result)"
    }
}
