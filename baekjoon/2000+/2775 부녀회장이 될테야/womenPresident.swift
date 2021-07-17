let t = Int(readLine()!)!

for _ in 0..<t {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 14), count: k+1)
    for i in 0..<14 {
        dp[0][i] += (i+1)
    }
    for i in 1..<k+1 {
        for j in 0..<n {
            dp[i][j] += dp[i-1][...j].reduce(0,+)
        }
    }
    print(dp[k][n-1])
}
