let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NM[0], M = NM[1]
let A = (1...N).map{String($0)}

func dfs(_ res: [String]) {
    
    if res.count == M {
        print(res.joined(separator: " "))
        return
    }
    
    for num in A {
        dfs(res+[num])
    }
}

dfs([])
