import Foundation

public func solution(_ A : inout [Int]) -> Int {
    guard !A.isEmpty else { return 1 }
    let N = A.count+1
    var dict:[Int:Bool] = [:]

    for num in A {
        dict[num] = true
    }

    for num in 1...N {
        if dict[num] == nil {
            return num
        }
    }

    return -1
}
