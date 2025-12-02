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
    DailyPuzzle(day: 13, solver: Day13Solver(), inputs: day13Inputs),
    DailyPuzzle(day: 14, solver: Day14Solver(), inputs: day14Inputs),
    DailyPuzzle(day: 15, solver: Day15Solver(), inputs: day15Inputs),
    DailyPuzzle(day: 16, solver: Day16Solver(), inputs: day16Inputs),
    DailyPuzzle(day: 17, solver: Day17Solver(), inputs: day17Inputs),
    DailyPuzzle(day: 18, solver: Day18Solver(), inputs: day18Inputs),
    DailyPuzzle(day: 19, solver: Day19Solver(), inputs: day19Inputs),
    DailyPuzzle(day: 20, solver: Day20Solver(), inputs: day20Inputs),
    DailyPuzzle(day: 21, solver: Day21Solver(), inputs: day21Inputs),
    DailyPuzzle(day: 22, solver: Day22Solver(), inputs: day22Inputs),
    DailyPuzzle(day: 23, solver: Day23Solver(), inputs: day23Inputs),
    DailyPuzzle(day: 24, solver: Day24Solver(), inputs: day24Inputs),
    DailyPuzzle(day: 25, solver: Day25Solver(), inputs: day25Inputs),
]

let whichDay = 1
let dayToRun = days[whichDay]

print(dayToRun.solveAll())
