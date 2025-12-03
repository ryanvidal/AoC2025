//
//  Day1Tests.swift
//  AoC2025
//
//  Created by Ryan Vidal on 12/2/25.
//

import Testing

@Suite() struct Day1Tests: DailyTests {
    let solver = Day1Solver()
    let inputs = day1Inputs
    
    @Test func part1Test() throws {
        #expect(part1Result() == inputs.part1ExampleAnswer)
    }
    @Test func part2Test() throws {
        #expect(part2Result() == inputs.part2ExampleAnswer)
    }
}
