let n = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 100)

for i in 0..<10 {
    dp[0][i] = 1
}

for i in 0..<99 {
    for j in 0..<10 {
        if j >= 1 { dp[i+1][j-1] += (dp[i][j] % 1_000_000_000) }
        if j <= 8 { dp[i+1][j+1] += (dp[i][j] % 1_000_000_000) }
    }
}
print((dp[n-1].reduce(0, +) - dp[n-1][0]) % 1_000_000_000)
