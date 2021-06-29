func solution(_ n:Int) -> Int {
    if n < 2 {
        return n
    }

    var dp = [Int](repeating: 0, count: n+1)
    dp[0] = 0
    dp[1] = 1


    for num in 2...n {
        dp[num] = (dp[num-1] + dp[num-2])%1234567
    }
    return dp[n]
}
