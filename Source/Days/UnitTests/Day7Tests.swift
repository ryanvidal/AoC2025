import Testing

@Suite(.disabled()) struct Day7Tests: DailyTests {
    let solver = Day7Solver()
    let inputs = day7Inputs

    @Test func part1Test() throws {
        #expect(part1Result() == inputs.part1ExampleAnswer)
    }

    @Test func part2Test() throws {
        #expect(part2Result() == inputs.part2ExampleAnswer)
    }
}
