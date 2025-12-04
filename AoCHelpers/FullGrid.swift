//
//  FullGrid.swift
//  AoC2022
//
//  Created by Ryan Vidal on 12/8/22.
//

import Foundation

public struct FullGrid<Element> {
    internal var grid: [[Element?]]
    
    private let width: Int
    private let height: Int
    
    public init(width: Int, height: Int) {
        grid = [[Element?]](repeating: [Element?](repeating: nil, count: width), count: height)
        self.width = width
        self.height = height
    }
    
    public subscript(point: Pair) -> Element? {
        get {
            return grid[point.y][point.x]
        }
        
        set(newValue) {
            grid[point.y][point.x] = newValue
        }
    }
    
    public subscript(x: Int, y: Int) -> Element? {
        get {
            return grid[y][x]
        }
        
        set(newValue) {
            grid[y][x] = newValue
        }
    }
    
    var xRange: ClosedRange<Int> {
        0...(width-1)
    }
    
    var yRange: ClosedRange<Int> {
        0...(height-1)
    }
}

public extension FullGrid {
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
    
    /// Returns all existing neighbors of the 8 surrounding points
    func getNeighbors(of point: Pair) -> [Element] {
        point.neighbors(bounds: (xRange, yRange)).compactMap {
            self[$0]
        }
    }
    
    /// Returns neighboring points that contain Elements
    func getNeighboringPoints(of point: Pair) -> [Pair] {
        point.neighbors(bounds: (xRange, yRange)).filter { self[$0] != nil }
    }
    
    /// Returns all existing neighbors of the 4 orthogonal points
    func getOrthogonalNeighbors(of point: Pair) -> [Element] {
        point.orthogonalNeighbors(bounds: (xRange, yRange)).compactMap {
            self[$0]
        }
    }
    
    /// Returns existing neighbors in the 4 orthogonal points
    func getNeighboringOrthogonalPoints(of point: Pair) -> [Pair] {
        point.orthogonalNeighbors(bounds: (xRange, yRange)).filter { self[$0] != nil }
    }
}
