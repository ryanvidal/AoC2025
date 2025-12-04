//
//  Grid3D.swift
//  AoC2022
//
//  Created by Ryan Vidal on 12/18/22.
//

internal import Algorithms
import Foundation

public struct Grid3D<Element> {
    internal var grid: [Point3D: Element]
    
    public init() {
        grid = [:]
    }
    
    public init(_ grid: [Point3D: Element]) {
        self.grid = grid
    }
    
    public subscript(point: Point3D) -> Element? {
        get {
            return grid[point]
        }

        set(newValue) {
            grid[point] = newValue
        }
    }
    
    public subscript(x: Int, y: Int, z: Int) -> Element? {
        get {
            return grid[Point3D(x, y, z)]
        }

        set(newValue) {
            grid[Point3D(x, y, z)] = newValue
        }
    }
}

public extension Grid3D {
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
    
    /// Returns all existing neighbors of the 8 surrounding points
    func getNeighbors(of point: Point3D) -> [Element] {
        point.neighbors(bounds: (xRange, yRange, zRange)).compactMap {
            grid[$0]
        }
    }
    
    /// Returns neighboring points that contain Elements
    func getNeighboringPoints(of point: Point3D) -> [Point3D] {
        point.neighbors(bounds: (xRange, yRange, zRange)).filter { self[$0] != nil }
    }
    
    /// Returns all existing neighbors of the 4 orthogonal points
    func getOrthogonalNeighbors(of point: Point3D) -> [Element] {
        point.orthogonalNeighbors(bounds: (xRange, yRange, zRange)).compactMap {
            grid[$0]
        }
    }
    
    /// Returns existing neighbors in the 4 orthogonal points
    func getNeighboringOrthogonalPoints(of point: Point3D) -> [Point3D] {
        point.orthogonalNeighbors(bounds: (xRange, yRange, zRange)).filter { self[$0] != nil }
    }
}
