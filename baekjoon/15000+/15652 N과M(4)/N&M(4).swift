let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = (1...NM[0]).map{String($0)}, M = NM[1]

func dfs(_ s:[String], _ cnt:Int) {
    
    if s.count == M {
        print(s.joined(separator: " "))
        return
    }
    
    for i in cnt..<N.count {
        dfs(s+[N[i]], i)
    }
}

dfs([], 0)
