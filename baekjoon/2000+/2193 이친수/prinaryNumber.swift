let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n+1)
dp[0] = 0
dp[1] = 1
for i in 1...n where i >= 2 {
    dp[i] = dp[i-1] + dp[i-2]
}
print(dp[n])
