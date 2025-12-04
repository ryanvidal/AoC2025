import Foundation

public enum PuzzlePart: CaseIterable {
    case part1Example
    case part1
    case part2Example
    case part2
    
    var isInPart1: Bool {
        switch self {
        case .part1Example, .part1: true
        default: false
        }
    }
    var isInPart2: Bool {
        switch self {
        case .part2Example, .part2: true
        default: false
        }
    }
    var isAnExample: Bool {
        switch self {
        case .part1Example, .part2Example: true
        default: false
        }
    }
}

extension [PuzzlePart] {
    static var all: [PuzzlePart] {
        PuzzlePart.allCases
    }
    static var examples: [PuzzlePart] {
        .all.filter(\.isAnExample)
    }
    static var allPart1: [PuzzlePart] {
        .all.filter(\.isInPart1)
    }
    static var allPart2: [PuzzlePart] {
        .all.filter(\.isInPart2)
    }
}

public struct DailyPuzzle {
    let day: Int
    let solver: any DailySolver
    let inputs: DailyPuzzleInputs

    private func solve(_ part: PuzzlePart) -> String {
        solver.resultString(of: part, using: inputs)
    }
    
    public func solveAll() -> String {
        solve(.all)
    }
    
    public func solve(_ parts: [PuzzlePart]) -> String {
        var output = "Results of Day \(day):\n"
        
        if parts.contains(where: \.isInPart1) {
            output.append("""
                ---
                Part 1
                ---
                
                """)
            if parts.contains(.part1Example) {
                output.append("Test answer:  \(solve(.part1Example))\n")
            }
            if parts.contains(.part1) {
                output.append("Final answer: \(solve(.part1))\n")
            }
        }
        
        if parts.contains(where: \.isInPart2) {
            output.append("""
                ---
                Part 2
                ---
                
                """)
            if parts.contains(.part2Example) {
                output.append("Test answer:  \(solve(.part2Example))\n")
            }
            if parts.contains(.part2) {
                output.append("Final answer: \(solve(.part2))\n")
            }
        }
        
        output.append("""
            
            """)
        
        return output
    }
}
