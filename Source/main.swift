//
//  main.swift
//  AoC2025
//
//  Created by Ryan Vidal on 12/2/25.
//

import Foundation

let days: [DailyPuzzle] = [
    DailyPuzzle(day:  0, solver: DayExampleSolver(), inputs: dayExampleInputs),
    DailyPuzzle(day:  1, solver: Day1Solver(),  inputs: day1Inputs),
    DailyPuzzle(day:  2, solver: Day2Solver(),  inputs: day2Inputs),
    DailyPuzzle(day:  3, solver: Day3Solver(),  inputs: day3Inputs),
    DailyPuzzle(day:  4, solver: Day4Solver(),  inputs: day4Inputs),
    DailyPuzzle(day:  5, solver: Day5Solver(),  inputs: day5Inputs),
    DailyPuzzle(day:  6, solver: Day6Solver(),  inputs: day6Inputs),
    DailyPuzzle(day:  7, solver: Day7Solver(),  inputs: day7Inputs),
    DailyPuzzle(day:  8, solver: Day8Solver(),  inputs: day8Inputs),
    DailyPuzzle(day:  9, solver: Day9Solver(),  inputs: day9Inputs),
    DailyPuzzle(day: 10, solver: Day10Solver(), inputs: day10Inputs),
    DailyPuzzle(day: 11, solver: Day11Solver(), inputs: day11Inputs),
    DailyPuzzle(day: 12, solver: Day12Solver(), inputs: day12Inputs),
]

let whichDay = 4
let dayToRun = days[whichDay]
let partsToRun: [PuzzlePart] = .allPart2

print(dayToRun.solve(partsToRun))
