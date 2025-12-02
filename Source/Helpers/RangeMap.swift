import Foundation
//import Collections
//import Algorithms

//struct RangeMap<Bound: Comparable & Hashable, Value: AdditiveArithmetic & Comparable> {
//    typealias Mapping = [Range<Bound>: Value]
//    
//    private var map: Mapping
//    
//    init(_ map: Mapping = [:]) {
//        self.map = map
//    }
//    
//    subscript(_ key: Bound) -> Value? {
//        for (keyRange, value) in map where keyRange.contains(key) {
//            return value
//        }
//        
//        return nil
//    }
//    
//    subscript(_ range: Range<Bound>) -> Value? {
//        get {
//            for (keyRange, value) in map where keyRange.contains(range) {
//                return value
//            }
//            return nil
//        }
//        set {
//            let overlappingValueMap = map.filter { $0.key.overlaps(range) }
//            
//            guard !overlappingValueMap.isEmpty else { map[range] = newValue; return }
//            
//            for mapEntry in overlappingValueMap {
//                map[mapEntry.key] = nil
//                
//                let (lower, intersection, higher) = splitRangesByOverlap(mapEntry.key, range)
//                
//                for newRange in [lower, intersection, higher].compactMap(\.self) {
//                    var newValue: Value = newRange.overlaps(mapEntry.key) ? mapEntry.value : .zero
//                    newValue += newRange.overlaps(range) ? newValue : .zero
//                    map[newRange] = newValue
//                }
//            }
//        }
//    }
//}
