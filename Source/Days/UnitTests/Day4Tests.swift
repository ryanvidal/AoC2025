import Testing

@Suite(.tags(.currentDay)) struct Day4Tests: DailyTests {
    let solver = Day4Solver()
    let inputs = day4Inputs

    @Test func part1Test() throws {
        #expect(part1Result() == inputs.part1ExampleAnswer)
    }

    @Test func part2Test() throws {
        #expect(part2Result() == inputs.part2ExampleAnswer)
    }
}
