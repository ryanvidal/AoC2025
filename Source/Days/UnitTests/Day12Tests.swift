import Testing

@Suite(.disabled()) struct Day12Tests: DailyTests {
    let solver = Day12Solver()
    let inputs = day12Inputs

    @Test func part1Test() throws {
        #expect(part1Result() == inputs.part1ExampleAnswer)
    }

    @Test func part2Test() throws {
        #expect(part2Result() == inputs.part2ExampleAnswer)
    }
}
