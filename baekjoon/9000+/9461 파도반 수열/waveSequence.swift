for _ in 0..<Int(readLine()!)! {
    var dp = [0,1,1,1,2,2,3,4,5,7,9]
    let n = Int(readLine()!)!
    guard n > 10 else {
        print(dp[n])
        continue
    }

    for i in 11...n {
        dp.append(max(dp[i-1], dp[i-2]+dp[i-3]))
    }
    
    print(dp[n])

}
