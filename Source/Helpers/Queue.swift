//
//  Queue.swift
//  AoC2022
//
//  Created by Ryan Vidal on 12/17/22.
//

import Foundation

public struct Queue<Element> {
    fileprivate var array: [Element] = []

    init() { self.init([]) }
    init(_ array: [Element]) { self.array = array } // Queue order is reversed

    mutating func enqueue(_ element: Element) {
        array.append(element)
    }

    mutating func dequeue() -> Element? {
        if !array.isEmpty {
            return array.removeFirst()
        } else {
            return nil
        }
    }

    func peek() -> Element? {
        return array.first
    }

    var isEmpty: Bool {
        return array.isEmpty
    }

    var count: Int {
        return array.count
    }
}
