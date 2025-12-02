//
//  FullGrid3D.swift
//  AoC2022
//
//  Created by Ryan Vidal on 12/18/22.
//

import Foundation

public struct FullGrid3D<Element> {
    var grid: [[[Element?]]]

    public let width: Int
    public let height: Int
    public let depth: Int

    init(width: Int, height: Int, depth: Int) {
        grid = [[[Element?]]](repeating: [[Element?]](repeating: [Element?](repeating: nil, count: width), count: height), count: depth)
        self.width = width
        self.height = height
        self.depth = depth
    }

    subscript(point: Point3D) -> Element? {
        get {
            return grid[point.z][point.y][point.x]
        }

        set(newValue) {
            grid[point.z][point.y][point.x] = newValue
        }
    }

    subscript(point: (Int, Int, Int)) -> Element? {
        get {
            return grid[point.2][point.1][point.0]
        }

        set(newValue) {
            grid[point.2][point.1][point.0] = newValue
        }
    }

    func getPoints(where predicate: (Element) -> Bool) -> [Point3D] {
        var points: [Point3D] = []

        for z in 0...(grid.count-1) {
            for y in 0...(grid[z].count-1) {
                for x in 0...(grid[z][y].count-1) {
                    if let element = grid[z][y][x], predicate(element) { points.append(Point3D(x,y,z)) }
                }
            }
        }

        return points
    }

    /// Returns the width and height as a tuple `(width, height, depth)`
    var size: (Int, Int, Int) {
        return (width, height, depth)
    }
}
