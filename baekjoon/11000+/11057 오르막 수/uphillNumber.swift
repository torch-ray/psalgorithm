let N = Int(readLine()!)!
var dp = [[Int](repeating: 1, count: 10)]

for _ in 0..<N {
    dp.append([Int](repeating: 0, count: 10))
}

for i in 1...N {
    for j in 0..<10 {
        dp[i][j] += Array(dp[i-1][...j]).reduce(0, +) % 10007
    }
}

print(dp[N][9])
