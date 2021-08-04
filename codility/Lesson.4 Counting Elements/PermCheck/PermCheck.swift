import Foundation

public func solution(_ A : inout [Int]) -> Int {
    var dict:[Int:Bool] = [:]

    for num in A {
        dict[num] = true
    }

    for num in 1...A.count {
        if dict[num] == nil {
            return 0
        }
    }
    return 1
}
