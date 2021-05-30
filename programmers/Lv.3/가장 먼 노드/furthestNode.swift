func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = [Int:[Int]]()
    
    for node in edge {
        let (a, b) = (node[0], node[1])
        if graph[a] == nil { graph[a] = [b] }
        else { graph[a]?.append(b) }
        if graph[b] == nil { graph[b] = [a] }
        else { graph[b]?.append(a) }
    }
    
    var queue = [(Int, Int)]()
    var res = [(Int, Int)]()
    var visited = [Bool](repeating: false, count: n+1)
    
    func bfs(_ key:Int, _ dis:Int) {
        for node in graph[key]! {
            if visited[node] { continue }
            visited[node] = true
            queue.append((node, dis))
            res.append((node, dis))
        }
    }
    
    queue.append((1, 0))
    visited[1] = true
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        bfs(node.0, node.1+1)
    }
    
    let far = res.map{$0.1}.max()!
    return res.filter{$0.1==far}.count
}
