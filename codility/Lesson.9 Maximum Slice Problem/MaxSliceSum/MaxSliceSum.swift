public func solution(_ A : inout [Int]) -> Int {
    var dp = [Int](repeating:0, count: A.count)
    var maxSum = -2_147_483_648

    for (idx, num) in A.enumerated() {
        if idx == 0 {
            dp[idx] = num
        } else {
            dp[idx] = max(num, dp[idx-1]+num)
        }
        maxSum = max(maxSum, dp[idx])
    }

    return maxSum
}
