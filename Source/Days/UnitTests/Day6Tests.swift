import Testing

@Suite(.disabled()) struct Day6Tests: DailyTests {
    let solver = Day6Solver()
    let inputs = day6Inputs

    @Test func part1Test() throws {
        #expect(part1Result() == inputs.part1ExampleAnswer)
    }

    @Test func part2Test() throws {
        #expect(part2Result() == inputs.part2ExampleAnswer)
    }
}
