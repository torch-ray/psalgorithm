import Foundation

public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
    var res = 0, end = -1
    let n = A.count

    for idx in 0..<n {
        if A[idx] > end {
            res+=1
            end = B[idx]
        }
    }

    return res
}
