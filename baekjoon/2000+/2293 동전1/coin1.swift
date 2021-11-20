let N = readLine()!.split{$0==" "}.map{Int(String($0))!}
var A:[Int] = [], dp = [Int](repeating: 0, count: N[1]+1)
dp[0]=1

for _ in 0..<N[0] {
    A.append(Int(readLine()!)!)
}

for i in A where i <= N[1] {
    for j in i...N[1] {
        dp[j] += dp[j-i]%2147483648
    }
}

print(dp[N[1]])
