let n = Int(readLine()!)!
let arr = readLine()!.split{$0==" "}.map{Int(String($0))!}
var dp = [Int](repeating: 1, count: n)

for i in 1..<n {
    for j in 0..<i {
        if arr[j] < arr[i] {
            dp[i] = max(dp[i], dp[j]+1)
        }
    }
}
print(dp.max()!)
