//
//  Grid.swift
//  AoC2022
//
//  Created by Ryan Vidal on 12/5/22.
//

import Algorithms
import Foundation

public struct Grid<Element> {
    var grid: [Pair: Element]

    init() {
        grid = [:]
    }

    init(_ grid: [Pair: Element]) {
        self.grid = grid
    }

    mutating func setValue(x: Int, y: Int, to value: Element) {
        setValue(at: Pair(x, y), to: value)
    }

    mutating func setValue(at location: Pair, to value: Element) {
        grid[location] = value
    }

    func getPoints(where predicate: (Element) -> Bool) -> [Pair] {
        return grid
            .filter { predicate($0.value) }
            .map { $0.key }
    }

    var points: [Pair] {
        return grid.map { $0.key }
    }

    var elements: [Element] {
        return grid.map { $0.value }
    }

    var size: (Int, Int) {
        var (xMax, yMax) = (0, 0)
        for point in points {
            if point.x > xMax { xMax = point.x }
            if point.y > yMax { yMax = point.y }
        }
        return (xMax+1, yMax+1)
    }

    var xRange: ClosedRange<Int> {
        let (min, max) = points.map { $0.x }.minAndMax()!

        return min...max
    }

    var yRange: ClosedRange<Int> {
        let (min, max) = points.map { $0.y }.minAndMax()!

        return min...max
    }

    subscript(point: Pair) -> Element? {
        get {
            return grid[point]
        }

        set(newValue) {
            grid[point] = newValue
        }
    }
}
