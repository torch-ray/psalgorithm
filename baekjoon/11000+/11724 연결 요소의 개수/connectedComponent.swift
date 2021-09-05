let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
var graph = [[Int]](repeating: [], count: NM[0]+1)

for _ in 0..<NM[1] {
    let n = readLine()!.split{$0==" "}.map{Int(String($0))!}
    graph[n[0]].append(n[1])
    graph[n[1]].append(n[0])
}

var v = [Bool](repeating: false, count: NM[0]+1), res = 0

func dfs(_ node:Int) {
    
    v[node] = true
    
    for nxt in graph[node] where !v[nxt] {
        dfs(nxt)
    }
}

for node in 1...NM[0] {
    if !v[node] {
        res+=1
        dfs(node)
    }
}
print(res)
