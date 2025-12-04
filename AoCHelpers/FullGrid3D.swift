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
    
    public init(width: Int, height: Int, depth: Int) {
        grid = [[[Element?]]](repeating: [[Element?]](repeating: [Element?](repeating: nil, count: width), count: height), count: depth)
        self.width = width
        self.height = height
        self.depth = depth
    }
    
    public subscript(point: Point3D) -> Element? {
        get {
            return grid[point.z][point.y][point.x]
        }
        
        set(newValue) {
            grid[point.z][point.y][point.x] = newValue
        }
    }
    
    public subscript(x: Int, y: Int, z: Int) -> Element? {
        get {
            return grid[z][y][x]
        }
        
        set(newValue) {
            grid[z][y][x] = newValue
        }
    }
    
    var xRange: ClosedRange<Int> { 0...(width-1) }
    var yRange: ClosedRange<Int> { 0...(height-1) }
    var zRange: ClosedRange<Int> { 0...(depth-1) }
}

public extension FullGrid3D {

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
    
    /// Returns all existing neighbors of the 8 surrounding points
    func getNeighbors(of point: Point3D) -> [Element] {
        point.neighbors(bounds: (xRange, yRange, zRange)).compactMap {
            self[$0]
        }
    }
    
    /// Returns neighboring points that contain Elements
    func getNeighboringPoints(of point: Point3D) -> [Point3D] {
        point.neighbors(bounds: (xRange, yRange, zRange)).filter { self[$0] != nil }
    }
    
    /// Returns all existing neighbors of the 4 orthogonal points
    func getOrthogonalNeighbors(of point: Point3D) -> [Element] {
        point.orthogonalNeighbors(bounds: (xRange, yRange, zRange)).compactMap {
            self[$0]
        }
    }
    
    /// Returns existing neighbors in the 4 orthogonal points
    func getNeighboringOrthogonalPoints(of point: Point3D) -> [Point3D] {
        point.orthogonalNeighbors(bounds: (xRange, yRange, zRange)).filter { self[$0] != nil }
    }
}
