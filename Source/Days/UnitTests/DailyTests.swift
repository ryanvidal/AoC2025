import Testing

protocol DailyTests<Solver> {
    associatedtype Solver: DailySolver
    var solver: Solver { get }
    var inputs: DailyPuzzleInputs { get }
}

extension DailyTests {
    public func part1Result() -> Int? {
        solver.result(of: .part1Example, using: inputs)
    }

    public func part2Result() -> Int? {
        solver.result(of: .part1Example, using: inputs)
    }
}

extension Tag {
  @Tag static var currentDay: Self
}
