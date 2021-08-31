let n = Int(readLine()!)!

var t: [Int] = [], p: [Int] = []

for _ in 0..<n {
    let N = readLine()!.split{$0==" "}.map{Int(String($0))!}
    t.append(N.first!)
    p.append(N.last!)
}

var dp = [Int](repeating: 0, count: 20)

for i in 0..<n {
    if dp[i] > dp[i+1] {
        dp[i+1] = dp[i]
    }
    
    if dp[i+t[i]] < dp[i] + p[i] {
        dp[i+t[i]] = dp[i] + p[i]
    }
}

print(dp[n])
