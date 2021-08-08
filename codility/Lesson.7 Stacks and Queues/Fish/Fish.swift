import Foundation

public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
    guard A.count > 1 else { return 1 }

    let n = A.count
    var alive: [(Int, Int)] = []

    for idx in 0..<n {
        var flag = false
        if alive.isEmpty {
            alive.append((A[idx], B[idx]))
        } else {
            if alive.last!.1 == B[idx] { // Never Meet
                alive.append((A[idx], B[idx]))
            } else { // Meet
                if alive.last!.1 == 0 {
                    alive.append((A[idx], B[idx]))
                } else {
                    while !alive.isEmpty && alive.last!.1 != B[idx]{
                        if alive.last!.0 < A[idx] {
                            alive.removeLast()
                        } else {
                            flag = true
                            break
                        }
                    }
                    if !flag { alive.append((A[idx], B[idx]))}
                }
            }
        }
    }
    return alive.count
}
