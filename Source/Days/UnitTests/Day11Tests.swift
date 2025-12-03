//
//  Day11Tests.swift
//  AoC2025
//
//  Created by Ryan Vidal on 12/2/25.
//

import Testing

@Suite(.disabled()) struct Day11Tests: DailyTests {
    let solver = Day11Solver()
    let inputs = day11Inputs

    @Test func part1Test() throws {
        #expect(part1Result() == inputs.part1ExampleAnswer)
    }

    @Test func part2Test() throws {
        #expect(part2Result() == inputs.part2ExampleAnswer)
    }
}
