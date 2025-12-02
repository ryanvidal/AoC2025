//
//  Pair.swift
//  AoC2021
//
//  Created by Ryan Vidal on 12/6/21.
//

import Foundation

public struct Pair: Hashable {
    let val: (Int, Int)

    init(_ x: Int, _ y: Int) {
        val = (x, y)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(val.0)
        hasher.combine(val.1)
    }

    static public func ==(left: Pair, right: Pair) -> Bool {
        return left.val == right.val
    }

    public var x: Int {
        return val.0
    }

    public var y: Int {
        return val.1
    }

    public var stringValue: String {
        "(\(x), \(y))"
    }
}

public extension Pair {
    func neighbors(bounds: (ClosedRange<Int>, ClosedRange<Int>)) -> [Pair] {
        var n: [Pair] = []
        for x in (self.x-1)...(self.x+1) {
            guard bounds.0.contains(x) else { continue }
            for y in (self.y-1)...(self.y+1) {
                guard bounds.1.contains(y) else { continue }
                if x != self.x || y != self.y {
                    n.append(Pair(x,y))
                }
            }
        }
        return n
    }

    func orthogonalNeighbors(bounds: (ClosedRange<Int>, ClosedRange<Int>)) -> [Pair] {
        return [
            Pair(self.x-1, self.y),
            Pair(self.x+1, self.y),
            Pair(self.x, self.y-1),
            Pair(self.x, self.y+1),
        ].filter { pair in bounds.0.contains(pair.x) && bounds.1.contains(pair.y) }
    }
}

public func ManhattanDistance(_ lhs: Pair, _ rhs: Pair) -> Int {
    abs(lhs.x - rhs.x) + abs(lhs.y - rhs.y)
}
