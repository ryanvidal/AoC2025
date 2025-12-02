//
//  Stack.swift
//  AoC2021
//
//  Created by Ryan Vidal on 12/10/21.
//

import Foundation

struct Stack<Element> {
    fileprivate var array: [Element] = []

    init() { self.init([]) }
    init(_ array: [Element]) { self.array = array.reversed() } // Stack order is reversed

    mutating func push(_ element: Element) {
        array.append(element)
    }

    mutating func pop() -> Element? {
        return array.popLast()
    }

    func peek() -> Element? {
        return array.last
    }

    var isEmpty: Bool {
        return array.isEmpty
    }

    var count: Int {
        return array.count
    }

    func reversed() -> Stack<Element> {
        let reversedArray = array.reversed()
        var newStack = Stack<Element>()
        for e in reversedArray {
            newStack.push(e)
        }

        return newStack
    }
}
