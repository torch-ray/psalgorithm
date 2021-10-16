let N = Int(readLine()!)!
var S:[[Int]] = []
var res = Int.max
for _ in 0..<N {
    S.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}

func sum(_ s:[Int], _ l:[Int]) -> Int {
    var res = 0
    
    for i in s {
        for j in s where i != j {
            res += S[i][j]
        }
    }
    
    for i in l {
        for j in l where i != j {
            res -= S[i][j]
        }
    }
    
    return abs(res)
}

func dfs(_ s:[Int], _ l:[Int], _ cur:Int) {
    
    if s.count == N/2 && l.count == N/2 {
        res = min(res, sum(s, l))
        return
    }
    
    if s.count < N/2 {
        dfs(s+[cur], l, cur+1)
    }
    
    if l.count < N/2 {
        dfs(s, l+[cur], cur+1)
    }
}

dfs([], [], 0)
print(res)
