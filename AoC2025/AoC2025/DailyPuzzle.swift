//
//  DailyPuzzle.swift
//  AoC2021
//
//  Created by Ryan Vidal on 12/1/21.
//

import Foundation

public enum PuzzlePart: CaseIterable {
    case part1Example
    case part1
    case part2Example
    case part2
}

public struct DailyPuzzleInputs {
    let part1Example: String
    let part2Example: String?
    let puzzleInput: String
    
    let part1ExampleAnswer: Int?
    let part2ExampleAnswer: Int?
    
    
    init(
        part1Example: String,
        part1ExampleAnswer: Int?,
        part2Example: String? = nil,
        part2ExampleAnswer: Int?,
        puzzleInput: String
    ) {
        self.part1Example = part1Example
        self.part2Example = part2Example
        self.puzzleInput = puzzleInput
        self.part1ExampleAnswer = part1ExampleAnswer
        self.part2ExampleAnswer = part2ExampleAnswer
    }
    
    func getInput(for part: PuzzlePart) -> String {
        switch part {
        case .part1, .part2: puzzleInput
        case .part1Example: part1Example
        case .part2Example: part2Example ?? part1Example
        }
    }
}

public struct DailyPuzzle {
    let day: Int
    let solver: any DailySolver
    let inputs: DailyPuzzleInputs

    private func solve(_ part: PuzzlePart) -> String {
        switch part {
        case .part1Example where part1ExampleAnswer != nil:
            solver.checkPart1Example(input(for: part), against: part1ExampleAnswer!)
        case .part1, .part1Example:
            solver.getPart1ResultString(from: input(for: part))
        case .part2Example where part2ExampleAnswer != nil:
            solver.checkPart2Example(input(for: part), against: part2ExampleAnswer!)
        case .part2, .part2Example:
            solver.getPart2ResultString(from: inputs.getInput(for: part))
        }
    }
    
    private func input(for part: PuzzlePart) -> String {
        inputs.getInput(for: part)
    }
    
    private var part1ExampleAnswer: Int? {
        inputs.part1ExampleAnswer
    }
    
    private var part2ExampleAnswer: Int? {
        inputs.part2ExampleAnswer
    }
    
    private func solvePart1() -> String {
        """
        Test answer:  \(solve(.part1Example))
        Final answer: \(solve(.part1))
        """
    }
    private func solvePart2() -> String {
        """
        Test answer:  \(solve(.part2Example))
        Final answer: \(solve(.part2))
        """
    }
    
    public func solveAll() -> String {
        """
        Results of Day \(day):
        ------------------
        Part 1
        ---
        \(solvePart1())
        ---
        Part 2
        ---
        \(solvePart2())
        ------------------
        """
    }
}
