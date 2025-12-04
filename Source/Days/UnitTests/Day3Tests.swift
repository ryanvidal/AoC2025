//
//  Day3Tests.swift
//
//  Created by Ryan Vidal on 12/2/25.
//

import Testing

@Suite() struct Day3Tests: DailyTests {
    let solver = Day3Solver()
    let inputs = day3Inputs

    @Test func part1Test() throws {
        #expect(part1Result() == inputs.part1ExampleAnswer)
    }

    @Test func part2Test() throws {
        #expect(part2Result() == inputs.part2ExampleAnswer)
    }
    
    enum OverdriveJoltages {
        static var tests = [
            ("987654321111111", 987654321111),
            ("811111111111119", 811111111119),
            ("234234234234278", 434234234278),
            ("818181911112111", 888911112111),
        ]
    }
    @Test(arguments: OverdriveJoltages.tests)
    func overdriveJoltageTest(_ input: String, _ expected: Int) async throws {
        let bank = Day3Solver.BatteryBank(input)!
        #expect(bank.overdriveJoltage == expected)
    }
}
