import Algorithms
import Foundation

struct Day2Solver: DailySolver {
    public typealias CalculationInput = [ClosedRange<Int>]
    
    public func parseInput(_ input: String) -> CalculationInput {
        let inputRanges = input.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: ",")
        debugPrint(inputRanges)
        return inputRanges.compactMap { inputRange in
            let bounds = inputRange.components(separatedBy: "-").map({ $0.trimmingCharacters(in: .whitespacesAndNewlines) }).compactMap(Int.init)
            guard bounds.count == 2 else { fatalError("Misformatted input range: \(inputRange)") }
            return bounds.first!...bounds.last!
        }
    }
    
    public func calculatePart1(_ input: CalculationInput) -> Int? {
        var invalidIds: Set<Int> = []
        
        // Naively check all ids
        for idRange in input {
            var idToCheck = idRange.lowerBound
            while idRange.contains(idToCheck) {
                if checkForSilliness(of: idToCheck) {
                    invalidIds.insert(idToCheck)
                }
                idToCheck += 1
            }
        }

        return invalidIds.reduce(0, +)
    }
    
    public func calculatePart2(_ input: CalculationInput) -> Int? {
        var invalidIds: Array<Int> = []
        
        // Naively check all ids
        for idRange in input {
            for idToCheck in idRange {
                if checkForExtraSilliness(of: idToCheck) {
                    invalidIds.append(idToCheck)
                }
            }
        }
        
//        let DEBUG = invalidIds.grouped(by: { id in
//            input.first(where: { $0.contains(id) })!
//        })
//        for idRange in input.sorted(by: { $0.lowerBound < $1.lowerBound }) {
//            debugPrint(idRange, DEBUG[idRange] ?? [])
//        }

        return invalidIds.reduce(0, +)
    }
    
    // If the number is just patterns repeating twice, the id is silly
    func checkForSilliness(of id: Int) -> Bool {
        let string = String(id)
        
        guard string.count.isMultiple(of: 2) else { return false }
        
        var secondHalfStartIndex = string.startIndex
        
        string.formIndex(&secondHalfStartIndex, offsetBy: string.count/2)
        
        for (char1, char2) in zip(string[..<secondHalfStartIndex], string[secondHalfStartIndex...]) {
            if char1 != char2 { return false }
        }
        
        return true
    }
    
    // If the number is any repeating pattern, the id is silly
    func checkForExtraSilliness(of id: Int) -> Bool {
        let string = String(id)
        
        guard string.count > 1 else { return false }
        
        // Check for all repeating digits to short circut check
        guard !string.allSatisfy({ char in
            char == string.first!
        }) else { return true }
        
        // Starting at the minimum for repeating
        var patternCount = 2
        var patternLength = string.count / patternCount
        
        // Loop until there aren't enough digits to make a pattern with that count (and skipping pattern length 1)
        while patternLength > 1 {
            let chunks = string.chunks(ofCount: patternLength)
            
            // This should fail if the chunks aren't all the same size
            if chunks.allSatisfy({ $0 == chunks.first! }) {
                return true
            }
            
            // Not silly, check a different pattern length
            patternCount += 1
            patternLength = string.count / patternCount
        }
        
        return false
    }
}

//MARK: - Inputs
public let day2Inputs = DailyPuzzleInputs(
    part1Example: testInputString,
    part1ExampleAnswer: 1227775554,
    part2ExampleAnswer: 4174379265,
    puzzleInput: puzzleInputString
)

// Correct Answers:
// P1: 20223751480
// P2: 30260171216

fileprivate let testInputString = """
11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124
"""

fileprivate let puzzleInputString = """
5542145-5582046,243-401,884211-917063,1174-1665,767028-791710,308275-370459,285243789-285316649,3303028-3361832,793080-871112,82187-123398,7788-14096,21-34,33187450-33443224,2750031-2956556,19974-42168,37655953-37738891,1759-2640,55544-75026,9938140738-9938223673,965895186-966026269,502675-625082,11041548-11204207,1-20,3679-7591,8642243-8776142,40-88,2872703083-2872760877,532-998,211488-230593,3088932-3236371,442734-459620,8484829519-8484873271,5859767462-5859911897,9987328-10008767,656641-673714,262248430-262271846
"""
