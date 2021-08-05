import Foundation

public func solution(_ A : inout [Int]) -> Int {
    var list:[Int] = [0]
    var res = 0

    for (idx, num) in A.enumerated() {
        switch num {
        case 0: list.append(list[idx])
        default: list.append(list[idx]+1)
        }
    }

    let count = list.last!
    for idx in 0..<A.count {
        if A[idx] == 0 {
            res += count - list[idx+1]
        }
    }
    
    return res > 1_000_000_000 ? -1:res
}
