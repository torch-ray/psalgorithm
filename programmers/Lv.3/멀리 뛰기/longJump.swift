func solution(_ n:Int) -> Int {
    if n == 1 { return 1 }
    var res = [1, 2]
    for i in 0..<(n-2) {
        res.append((res[i]+res[i+1])%1234567)
    }
    return res.last!
}
