import Foundation

public func solution(_ A : inout [Int]) -> Int {
    var dict:[Int: Int] = [:]
    
    for num in A {
        dict[num] = (dict[num] ?? 0)+1
    }

    return dict.count
}
