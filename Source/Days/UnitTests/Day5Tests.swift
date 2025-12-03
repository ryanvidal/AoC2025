//
//  Day5Tests.swift
//
//  Created by Ryan Vidal on 12/2/25.
//

import Testing

@Suite(.disabled()) struct Day5Tests: DailyTests {
    let solver = Day5Solver()
    let inputs = day5Inputs

    @Test func part1Test() throws {
        #expect(part1Result() == inputs.part1ExampleAnswer)
    }

    @Test func part2Test() throws {
        #expect(part2Result() == inputs.part2ExampleAnswer)
    }
}
