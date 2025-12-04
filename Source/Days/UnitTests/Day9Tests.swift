import Testing

@Suite(.disabled()) struct Day9Tests: DailyTests {
    let solver = Day9Solver()
    let inputs = day9Inputs

    @Test func part1Test() throws {
        #expect(part1Result() == inputs.part1ExampleAnswer)
    }

    @Test func part2Test() throws {
        #expect(part2Result() == inputs.part2ExampleAnswer)
    }
}
