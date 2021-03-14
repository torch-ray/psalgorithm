func solution(_ n:Int) -> Int {
    var prime = [Bool](repeating: false, count: n+1)
    var cnt = 0
    for i in 2...n {
        if prime[i] == false {
            cnt+=1
            for j in stride(from: i, to: n+1, by: i) {
                prime[j] = true
            }
        }
    }
    return cnt
}
