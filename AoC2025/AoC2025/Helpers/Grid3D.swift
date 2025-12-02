//
//  Grid3D.swift
//  AoC2022
//
//  Created by Ryan Vidal on 12/18/22.
//

import Foundation
import Algorithms

public struct Grid3D<Element> {
    var grid: [Point3D: Element]

    init() {
        grid = [:]
    }

    init(_ grid: [Point3D: Element]) {
        self.grid = grid
    }

    func getPoints(where predicate: (Element) -> Bool) -> [Point3D] {
        return grid
            .filter { predicate($0.value) }
            .map { $0.key }
    }

    var points: [Point3D] {
        return grid.map { $0.key }
    }

    var elements: [Element] {
        return grid.map { $0.value }
    }

    var xRange: ClosedRange<Int> {
        let (min, max) = points.map { $0.x }.minAndMax()!

        return min...max
    }

    var yRange: ClosedRange<Int> {
        let (min, max) = points.map { $0.y }.minAndMax()!

        return min...max
    }

    var zRange: ClosedRange<Int> {
        let (min, max) = points.map { $0.z }.minAndMax()!

        return min...max
    }

    subscript(point: Point3D) -> Element? {
        get {
            return grid[point]
        }

        set(newValue) {
            grid[point] = newValue
        }
    }
}
