public struct DailyPuzzleInputs {
    let part1Example: String
    let part2Example: String?
    let puzzleInput: String
    
    let part1ExampleAnswer: Int?
    let part2ExampleAnswer: Int?
    
    
    init(
        part1Example: String,
        part1ExampleAnswer: Int?,
        part2Example: String? = nil,
        part2ExampleAnswer: Int?,
        puzzleInput: String
    ) {
        self.part1Example = part1Example
        self.part2Example = part2Example
        self.puzzleInput = puzzleInput
        self.part1ExampleAnswer = part1ExampleAnswer
        self.part2ExampleAnswer = part2ExampleAnswer
    }
    
    func getInput(for part: PuzzlePart) -> String {
        switch part {
        case .part1, .part2: puzzleInput
        case .part1Example: part1Example
        case .part2Example: part2Example ?? part1Example
        }
    }
    
    func getExpectedValue(for part: PuzzlePart) -> Int? {
        switch part {
        case .part1Example: part1ExampleAnswer
        case .part2Example: part2ExampleAnswer
        default: nil
        }
    }
}
