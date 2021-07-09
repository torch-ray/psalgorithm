func solution(_ a:[Int], _ edges:[[Int]]) -> Int64 {

    var nodes = [[Int]](repeating: [], count: a.count)
    var weights = a
    var res:Int64 = 0

    func dfs(_ current:Int, _ parent:Int) {
        for node in nodes[current] {
            if node != parent {
                dfs(node, current)
            }
        }
        weights[parent] += weights[current]
        res += Int64(abs(weights[current]))
    }

    if weights.reduce(0, +) == 0 {

        for edge in edges {
            nodes[edge.first!].append(edge.last!)
            nodes[edge.last!].append(edge.first!)
        }

        dfs(0, 0)

        return res
    }

    return -1
}
