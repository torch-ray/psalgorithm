import Foundation

public func solution(_ A : inout [Int]) -> Int {

    guard A.count > 1 else { return abs(A.first! + A.first!) }

    var list: [(Int, Int)] = []
    var res = 2_000_000_000

    for num in A {
        let tuple = num < 0 ? (abs(num), -1):(num, 1)
        list.append(tuple)
    }

    list.sort { $0.0 < $1.0 }

    for idx in 0..<list.count-1 {
        let cur = (list[idx].0 * list[idx].1)
        let next = (list[idx+1].0 * list[idx+1].1)
        res = min(res, abs(cur+cur), abs(cur+next))
    }

    return res
}
