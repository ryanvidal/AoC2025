import Foundation

public enum PuzzleDay: Int, CaseIterable {
    case day1 = 1
    case day2 = 2
    case day3 = 3
    case day4 = 4
    case day5 = 5
    case day6 = 6
    case day7 = 7
    case day8 = 8
    case day9 = 9
    case day10 = 10
    case day11 = 11
    case day12 = 12
    
    var solver: any DailySolver {
        switch self {
        case .day1:
            Day1Solver()
        case .day2:
            Day2Solver()
        case .day3:
            Day3Solver()
        case .day4:
            Day4Solver()
        case .day5:
            Day5Solver()
        case .day6:
            Day6Solver()
        case .day7:
            Day7Solver()
        case .day8:
            Day8Solver()
        case .day9:
            Day9Solver()
        case .day10:
            Day10Solver()
        case .day11:
            Day11Solver()
        case .day12:
            Day12Solver()
        }
    }
    
    var inputs: DailyPuzzleInputs {
        switch self {
        case .day1:
            day1Inputs
        case .day2:
            day2Inputs
        case .day3:
            day3Inputs
        case .day4:
            day4Inputs
        case .day5:
            day5Inputs
        case .day6:
            day6Inputs
        case .day7:
            day7Inputs
        case .day8:
            day8Inputs
        case .day9:
            day9Inputs
        case .day10:
            day10Inputs
        case .day11:
            day11Inputs
        case .day12:
            day12Inputs
        }
    }
    
    var puzzle: DailyPuzzle {
        DailyPuzzle(day: rawValue, solver: solver, inputs: inputs)
    }
}
