import Foundation

public func solution(_ A : inout [Int]) -> Int {
    var a = A.sorted()
    var res1 = -1000*1000*1000, res2 = res1
    let n = a.count

    if n >= 3 {
        res1 = a[n-1] * a[n-2] * a[n-3]
    }

    if n >= 4 {
        res2 = a[0] * a[1] * a[n-1]
    }

    return max(res1, res2)
}
