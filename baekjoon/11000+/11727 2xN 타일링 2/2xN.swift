import Foundation
let n = Int(readLine()!)!
var dp = [0, 1, 3]
guard n >= 3 else {
    print(dp[n])
    exit(0)
}
for i in 3...n {
    dp.append((dp[i-1]+dp[i-2]*2)%10_007)
}
print(dp[n])
