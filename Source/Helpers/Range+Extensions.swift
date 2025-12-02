//
//  Range+Extensions.swift
//  AoC2023
//
//  Created by Ryan Vidal on 8/8/25.
//

import Collections
import Foundation

extension Range where Bound: Comparable {
    /// Returns the range of the overlap with another range
    func intersection(with other: Self) -> Self? {
        let lower = Swift.max(self.lowerBound, other.lowerBound)
        let upper = Swift.min(self.upperBound, other.upperBound)
        guard lower < upper else { return nil } // Check for valid non-empty intersection
        return lower..<upper
    }
    
    /// Removes a list of ranges from self.
    /// ie - within the lower and upper bound of self, any intersections from the ranges being operated on will be removed, returning an array of remaining ranges
    func subtracting(_ ranges: [Self]) -> [Self] {
        // Start with the full range as the only "remaining" range
        var result: [Self] = [self]
        
        // For each range to subtract
        for removal in ranges {
            var newResult: [Self] = []
            
            for current in result {
                // If there's no overlap, keep the current range as-is
                if removal.upperBound <= current.lowerBound || removal.lowerBound >= current.upperBound {
                    newResult.append(current)
                    continue
                }
                
                // If removal fully covers current, drop it
                if removal.lowerBound <= current.lowerBound && removal.upperBound >= current.upperBound {
                    continue
                }
                
                // If there's overlap at the start of current, trim the front
                if removal.lowerBound > current.lowerBound {
                    newResult.append(current.lowerBound..<Swift.min(removal.lowerBound, current.upperBound))
                }
                
                // If there's overlap at the end of current, trim the back
                if removal.upperBound < current.upperBound {
                    newResult.append(Swift.max(removal.upperBound, current.lowerBound)..<current.upperBound)
                }
            }
            
            result = newResult
        }
        
        return result
    }
}

extension Range where Bound: AdditiveArithmetic {
    func applyingOffset(_ offset: Bound) -> Self {
        return (lowerBound + offset)..<(upperBound + offset)
    }
}

/// Returns the ranges with any overlap between them
func splitRangesByOverlap<Bound: Comparable>(_ lhs: Range<Bound>, _ rhs: Range<Bound>) -> (lower: Range<Bound>?, intersection: Range<Bound>?, higher: Range<Bound>?) {
    guard lhs != rhs else {
        return (nil, lhs, nil)
    }
    
    if let intersection = lhs.intersection(with: rhs) {
        let left = Swift.min(lhs.lowerBound, rhs.lowerBound)..<intersection.lowerBound
        let right = intersection.upperBound..<Swift.max(lhs.upperBound, rhs.upperBound)
        
        let lower = left.isEmpty ? nil : left
        let higher = right.isEmpty ? nil : right
        return (lower, intersection, higher)
    } else {
        if lhs.lowerBound < rhs.lowerBound {
            return (lhs, nil, rhs)
        } else {
            return (rhs, nil, lhs)
        }
    }
}

extension OrderedSet where Element: RangeExpression, Element.Bound: Comparable {
    /// Adds a range to the set, inserting it in order by lower bound,
    /// and collapsing any overlapping or contiguous ranges into a single entry.
    ///
    /// Notes:
    /// - This implementation supports `Range<Bound>` (half-open) and `ClosedRange<Bound>` (closed).
    /// - If `Element` is some other `RangeExpression` kind (e.g. `PartialRangeFrom`), the method
    ///   currently returns early (no-op). You can extend it to support those if needed.
    mutating func orderedInsertWithReductions(_ newRange: Element) {
        // --- 1) Extract concrete lower/upper bounds from the incoming range ---
        var newLower: Element.Bound
        var newUpper: Element.Bound

        // Support half-open Range<Bound>
        if let r = newRange as? Range<Element.Bound> {
            newLower = r.lowerBound
            newUpper = r.upperBound
        }
        // Support closed ClosedRange<Bound>
        else if let cr = newRange as? ClosedRange<Element.Bound> {
            newLower = cr.lowerBound
            newUpper = cr.upperBound
        }
        // Unsupported RangeExpression kind — bail out safely.
        else {
            return
        }

        // We'll expand these as we discover overlapping / touching ranges.
        var mergedLower = newLower
        var mergedUpper = newUpper

        // --- 2) Find existing ranges that overlap or touch the new range ---
        var indexesToRemove: [Int] = []

        for (index, existing) in self.enumerated() {
            // Extract bounds from the existing element (supports Range and ClosedRange).
            let exLower: Element.Bound
            let exUpper: Element.Bound

            if let r = existing as? Range<Element.Bound> {
                exLower = r.lowerBound
                exUpper = r.upperBound
            } else if let cr = existing as? ClosedRange<Element.Bound> {
                exLower = cr.lowerBound
                exUpper = cr.upperBound
            } else {
                // If the set contains other RangeExpression kinds, skip them.
                continue
            }

            // If existing is completely before the new range with a gap, skip it.
            // (For "touching" we treat equality of boundary values as touching.)
            if exUpper < mergedLower && exUpper != mergedLower {
                continue
            }

            // If existing is completely after the new range with a gap, skip it.
            if exLower > mergedUpper && exLower != mergedUpper {
                continue
            }

            // Otherwise they overlap or touch — mark for removal and expand merged bounds.
            indexesToRemove.append(index)
            if exLower < mergedLower { mergedLower = exLower }
            if exUpper > mergedUpper { mergedUpper = exUpper }
        }

        // --- 3) Remove all overlapping/touching ranges (reverse order to keep indices valid) ---
        for idx in indexesToRemove.sorted(by: >) {
            self.remove(at: idx)
        }

        // --- 4) Create merged range in the same concrete type as Element and insert in order ---
        // Find the insertion index by comparing lower bounds.
        let insertIndex = self.firstIndex(where: { existing -> Bool in
            let lower: Element.Bound
            if let r = existing as? Range<Element.Bound> { lower = r.lowerBound }
            else if let cr = existing as? ClosedRange<Element.Bound> { lower = cr.lowerBound }
            else { return false }
            return lower > mergedLower
        })

        // If the OrderedSet's Element type is Range<Bound>, construct a half-open merged range.
        if Element.self == Range<Element.Bound>.self {
            let merged = mergedLower..<mergedUpper
            if let i = insertIndex {
                self.insert(merged as! Element, at: i)
            } else {
                self.append(merged as! Element)
            }
            return
        }

        // Otherwise default to constructing a ClosedRange<Bound> merged range.
        // (If Element is actually ClosedRange<Bound>, this will match; for other types
        // it will attempt a cast and may trap — if you have other Element kinds, add handling above.)
        let mergedClosed = mergedLower...mergedUpper
        if let i = insertIndex {
            self.insert(mergedClosed as! Element, at: i)
        } else {
            self.append(mergedClosed as! Element)
        }
    }
}



