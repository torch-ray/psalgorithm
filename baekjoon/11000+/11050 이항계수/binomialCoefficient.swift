let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = (1...NM[0]).map{$0}, M = NM[1]
var res = 0

func dfs(_ s:[Int], _ cnt:Int) {
    
    if s.count == M {
        res += 1
        return
    }
    
    for i in cnt..<N.count {
        dfs(s+[N[i]], i+1)
    }
}

dfs([], 0)
print(res)
