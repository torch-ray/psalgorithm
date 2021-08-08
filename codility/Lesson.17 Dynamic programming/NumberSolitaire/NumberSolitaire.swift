import Foundation

public func solution(_ A : inout [Int]) -> Int {
    guard A.count > 2 else { return A.reduce(0, +) }
    var dp = [Int](repeating: 0, count: A.count)
    
    for idx in 0..<A.count {
        switch idx {
        case 0: dp[idx] = A[idx]
        case 1: dp[idx] = dp[idx-1] + A[idx]
        case 2: dp[idx] = max(dp[idx-2], dp[idx-1]) + A[idx]
        case 3: dp[idx] = max(dp[idx-3], dp[idx-2], dp[idx-1]) + A[idx]
        case 4: dp[idx] = max(dp[idx-4], dp[idx-3], dp[idx-2], dp[idx-1]) + A[idx]
        case 5: dp[idx] = max(dp[idx-5], dp[idx-4], dp[idx-3], dp[idx-2], dp[idx-1]) + A[idx]
        default: dp[idx] = max(dp[idx-6], dp[idx-5], dp[idx-4], dp[idx-3], dp[idx-2], dp[idx-1]) + A[idx]
        }
    }

    return dp.last!
}
