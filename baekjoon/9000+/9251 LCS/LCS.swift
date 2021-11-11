let N = readLine()!.map{$0}, M = readLine()!.map{$0}
var dp = [[Int]](repeating: [Int](repeating: 0, count: N.count+1), count: M.count+1)

for i in 1...M.count {
    for j in 1...N.count {
        if M[i-1] != N[j-1] {
            dp[i][j] = max(dp[i][j-1], dp[i-1][j])
        } else {
            dp[i][j] = dp[i-1][j-1]+1
        }
    }
}
print(dp[M.count][N.count])
