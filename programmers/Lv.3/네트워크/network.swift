func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var visited = [Bool](repeating: false, count: n)
    var res = 0
    
    func bfs(_ node:Int) {
        visited[node] = true
        for idx in 0..<n {
            if computers[node][idx] == 1 && !visited[idx] {
                bfs(idx)
            }
        }
    }
    
    for idx in 0..<n {
        if !visited[idx] {
            bfs(idx)
            res+=1
        }
    }
    
    return res
}
