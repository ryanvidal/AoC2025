//
//  DayUnitTests.swift
//  DayUnitTests
//
//  Created by Ryan Vidal on 12/2/25.
//

import Testing

@Suite() struct Day2Tests: DailyTests {
    let solver = Day2Solver()
    let inputs = day2Inputs
    
    @Test func part1Test() throws {
        #expect(part1Result() == inputs.part1ExampleAnswer)
    }
    @Test func part2Test() throws {
        #expect(part2Result() == inputs.part2ExampleAnswer)
    }
    
    enum ExtraSilliness {
        static var cases: [(Int, Bool)] = [
            // 1 digit
            (1, false),
            // 2 digit
            (11, true),
            (12, false),
            // 3 digit
            (111, true),
            (121, false),
            (123, false),
            // 4 digit
            (1111, true),
            (1212, true),
            (1231, false),
            (1234, false),
            // 5 digit
            (11111, true),
            (12121, false),
            (12312, false),
            (12341, false),
            (12345, false),
            // 6 digit
            (111111, true),
            (121212, true),
            (123123, true),
            (123412, false),
            (123451, false),
            (123456, false),
            // 7 digit
            (1111111, true),
            (1212121, false),
            (1231231, false),
            (1234123, false),
            (1234512, false),
            (1234561, false),
            (1234567, false),
            // 8 digit
            (11111111, true),
            (12121212, true),
            (12312312, false),
            (12341234, true),
            (12345123, false),
            (12345612, false),
            (12345671, false),
            (12345678, false),
            // 9 digit
            (111111111, true),
            (121212121, false),
            (123123123, true),
            (123412341, false),
            (123451234, false),
            (123456123, false),
            (123456712, false),
            (123456781, false),
            (123456789, false),
            // 10 digit
            (1111111111, true),
            (1212121212, true),
            (1231231231, false),
            (1234123412, false),
            (1234512345, true),
            (1234561234, false),
            (1234567123, false),
            (1234567812, false),
            (1234567891, false),
            (1234567890, false),
        ]
    }
    @Test("Passes all cases", arguments: ExtraSilliness.cases)
    func validateExtraSilliness(_ testCase: (Int, Bool)) async throws {
        let solver = Day2Solver()
        
        #expect(solver.checkForExtraSilliness(of: testCase.0) == testCase.1)
    }

}
