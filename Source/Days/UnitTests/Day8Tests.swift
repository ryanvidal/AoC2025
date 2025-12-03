//
//  Day8Tests.swift
//
//  Created by Ryan Vidal on 12/2/25.
//

import Testing

@Suite(.disabled()) struct Day8Tests: DailyTests {
    let solver = Day8Solver()
    let inputs = day8Inputs

    @Test func part1Test() throws {
        #expect(part1Result() == inputs.part1ExampleAnswer)
    }

    @Test func part2Test() throws {
        #expect(part2Result() == inputs.part2ExampleAnswer)
    }
}
