//
//  DailyTests.swift
//  AoC2025
//
//  Created by Ryan Vidal on 12/2/25.
//

import Testing

protocol DailyTests<Solver> {
    associatedtype Solver: DailySolver
    var solver: Solver { get }
    var inputs: DailyPuzzleInputs { get }
}

extension DailyTests {
    public func part1Result() -> Int? {
        let input = solver.parseInput(inputs.part1Example)
        return solver.calculatePart1(input)
    }

    public func part2Result() -> Int? {
        let input = solver.parseInput(inputs.part2Example ?? inputs.part1Example)
        return solver.calculatePart2(input)
    }
}

extension Tag {
  @Tag static var currentDay: Self
}
