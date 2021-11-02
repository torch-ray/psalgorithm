for _ in 0..<Int(readLine()!)! {
    
    let N = Int(readLine()!)!
    var S:[[Int]] = []
    
    for _ in 0..<2 {
        S.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
    }
    
    if N == 1 {
        print(max(S[0][0], S[1][0]))
        continue
    }
    
    S[0][1] += S[1][0]
    S[1][1] += S[0][0]
    
    for i in 2..<N {
        S[0][i] += max(S[1][i-1], S[1][i-2], S[0][i-2])
        S[1][i] += max(S[0][i-1], S[0][i-2], S[1][i-2])
    }
    
    print(max(S[0][N-1], S[1][N-1]))
}
