import Foundation

public func solution(_ A : inout [Int]) -> Int {
    var minAvg = (Float(A[0])+Float(A[1]))/2
    var res = 0
    for idx in 2..<A.count {

        let threeAvg = (Float(A[idx-2])+Float(A[idx-1])+Float(A[idx]))/3
        if minAvg > threeAvg {
            minAvg = threeAvg
            res = idx-2
        }

        let twoAvg = (Float(A[idx-1])+Float(A[idx]))/2
        if minAvg > twoAvg {
            minAvg = twoAvg
            res = idx-1
        }
    }
    return res
}
