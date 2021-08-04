import Foundation

public func solution(_ A : inout [Int]) -> Int {
    let total = A.reduce(0, +)
    var previous = 0, res = Int.max

    for idx in 0..<A.count-1 {
        previous += A[idx]
        let difference = abs((previous*2)-total)
        res = min(res, difference)
    }

    return res
}
