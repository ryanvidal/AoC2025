//
//  FullGrid.swift
//  AoC2022
//
//  Created by Ryan Vidal on 12/8/22.
//

import Foundation

public struct FullGrid<Element> {
    var grid: [[Element?]]

    private let width: Int
    private let height: Int

    init(width: Int, height: Int) {
        grid = [[Element?]](repeating: [Element?](repeating: nil, count: width), count: height)
        self.width = width
        self.height = height
    }

    subscript(point: Pair) -> Element? {
        get {
            return grid[point.y][point.x]
        }

        set(newValue) {
            grid[point.y][point.x] = newValue
        }
    }

    subscript(point: (Int, Int)) -> Element? {
        get {
            return grid[point.1][point.0]
        }

        set(newValue) {
            grid[point.1][point.0] = newValue
        }
    }

    func getPoints(where predicate: (Element) -> Bool) -> [Pair] {
        var points: [Pair] = []

        for y in 0...(grid.count-1) {
            for x in 0...(grid[y].count-1) {
                if let element = grid[y][x], predicate(element) { points.append(Pair(x,y)) }
            }
        }

        return points
    }

    /// Returns the width and height as a tuple `(width, height)`
    var size: (Int, Int) {
        return (width, height)
    }
}
