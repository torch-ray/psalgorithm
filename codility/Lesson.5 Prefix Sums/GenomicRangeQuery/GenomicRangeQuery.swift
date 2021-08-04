import Foundation

public func check(_ arr:[Int], _ from:Int, _ to:Int) -> Bool {
    return arr[to+1] - arr[from] > 0
}

public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    var res:[Int] = []
    var (A, C, G) = ([0], [0], [0])
    let N = P.count

    for (idx, str) in S.enumerated() {
        if str == "A" {
            A.append(A[idx]+1)
            C.append(C[idx])
            G.append(G[idx])
        } else if str == "C" {
            A.append(A[idx])
            C.append(C[idx]+1)
            G.append(G[idx])
        } else if str == "G" {
            A.append(A[idx])
            C.append(C[idx])
            G.append(G[idx]+1)
        } else {
            A.append(A[idx])
            C.append(C[idx])
            G.append(G[idx])
        }
    }

    for idx in 0..<N {
        if check(A, P[idx], Q[idx]) {
            res.append(1)
        } else if check(C, P[idx], Q[idx]) {
            res.append(2)
        } else if check(G, P[idx], Q[idx]) {
            res.append(3)
        } else {
            res.append(4)
        }
    }

    return res
}
