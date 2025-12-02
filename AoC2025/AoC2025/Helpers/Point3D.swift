//
//  Point3D.swift
//  AoC2022
//
//  Created by Ryan Vidal on 12/18/22.
//

import Foundation

public struct Point3D: Hashable {
    let val: (Int, Int, Int)

    init(_ x: Int, _ y: Int, _ z: Int) {
        val = (x, y, z)
    }

    init?(_ input: String) {
        let components = input.components(separatedBy: [",", " "])
        guard components.count == 3 else { return nil }
        guard let x = Int(components[0]),
              let y = Int(components[1]),
              let z = Int(components[2]) else { return nil }

        val = (x, y, z)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(val.0)
        hasher.combine(val.1)
        hasher.combine(val.2)
    }

    static public func ==(left: Point3D, right: Point3D) -> Bool {
        return left.val == right.val
    }

    public var x: Int {
        return val.0
    }

    public var y: Int {
        return val.1
    }

    public var z: Int {
        return val.2
    }

    public var stringValue: String {
        "(\(x), \(y), \(z))"
    }
}

public extension Point3D {
    func neighbors(bounds: (ClosedRange<Int>, ClosedRange<Int>, ClosedRange<Int>)) -> [Point3D] {
        var n: [Point3D] = []
        for x in (self.x-1)...(self.x+1) {
            guard bounds.0.contains(x) else { continue }
            for y in (self.y-1)...(self.y+1) {
                guard bounds.1.contains(y) else { continue }
                for z in (self.z-1)...(self.z+1) {
                    guard bounds.2.contains(z) else { continue }
                    if x != self.x || y != self.y || z != self.z {
                        n.append(Point3D(x,y,z))
                    }
                }
            }
        }
        return n
    }

    func orthogonalNeighbors(bounds: (ClosedRange<Int>, ClosedRange<Int>, ClosedRange<Int>)) -> [Point3D] {
        return [
            Point3D(self.x-1, self.y, self.z),
            Point3D(self.x, self.y-1, self.z),
            Point3D(self.x, self.y, self.z-1),
            Point3D(self.x, self.y, self.z+1),
            Point3D(self.x, self.y+1, self.z),
            Point3D(self.x+1, self.y, self.z),
        ].filter { pair in bounds.0.contains(pair.x) && bounds.1.contains(pair.y) && bounds.2.contains(pair.z) }
    }
}

public func ManhattanDistance(_ lhs: Point3D, _ rhs: Point3D) -> Int {
    abs(lhs.x - rhs.x) + abs(lhs.y - rhs.y) + abs(lhs.z - rhs.z)
}
