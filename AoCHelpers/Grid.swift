//
//  Grid.swift
//  AoC2022
//
//  Created by Ryan Vidal on 12/5/22.
//

internal import Algorithms
import Foundation

public struct Grid<Element> {
    internal var grid: [Pair: Element]
    
    public init() {
        grid = [:]
    }
    
    public init(_ grid: [Pair: Element]) {
        self.grid = grid
    }
    
    mutating func setValue(x: Int, y: Int, to value: Element) {
        grid[Pair(x, y)] = value
    }
    
    mutating func setValue(at location: Pair, to value: Element) {
        grid[location] = value
    }
    
    public subscript(point: Pair) -> Element? {
        get {
            return grid[point]
        }

        set(newValue) {
            grid[point] = newValue
        }
    }
    
    public subscript(x: Int, y: Int) -> Element? {
        get {
            return grid[Pair(x, y)]
        }
        
        set(newValue) {
            grid[Pair(x, y)] = newValue
        }
    }
}

public extension Grid {
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
        let (min, max) = points.map { $0.x }.minAndMax() ?? (0,0)

        return min...max
    }

    var yRange: ClosedRange<Int> {
        let (min, max) = points.map { $0.y }.minAndMax() ?? (0,0)

        return min...max
    }
    
    /// Returns all existing neighbors of the 8 surrounding points
    func getNeighbors(of point: Pair) -> [Element] {
        point.neighbors(bounds: (xRange, yRange)).compactMap {
            grid[$0]
        }
    }
    
    /// Returns neighboring points that contain Elements
    func getNeighboringPoints(of point: Pair) -> [Pair] {
        point.neighbors(bounds: (xRange, yRange)).filter { self[$0] != nil }
    }
    
    /// Returns all existing neighbors of the 4 orthogonal points
    func getOrthogonalNeighbors(of point: Pair) -> [Element] {
        point.orthogonalNeighbors(bounds: (xRange, yRange)).compactMap {
            grid[$0]
        }
    }
    
    /// Returns existing neighbors in the 4 orthogonal points
    func getNeighboringOrthogonalPoints(of point: Pair) -> [Pair] {
        point.orthogonalNeighbors(bounds: (xRange, yRange)).filter { self[$0] != nil }
    }
}
