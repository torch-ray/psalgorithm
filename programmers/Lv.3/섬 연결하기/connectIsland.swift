func solution(_ n:Int, _ costs:[[Int]]) -> Int {

    var parents = (0..<n).map{$0}
    let costs = costs.sorted {$0[2] < $1[2]}

    func isCycle(_ left:Int, _ right:Int) -> Bool {
        return parents[left] == parents[right]
    }

    func getParents(_ child:Int) -> Int {
        return parents[child] == child ? child : getParents(parents[child])
    }

    func makeBridge(_ left:Int, _ right:Int) {
        let new = getParents(left)
        let old = getParents(right)
        parents.indices.filter {parents[$0] == old}.forEach {parents[$0] = new}
    }

    var res = 0
    for cost in costs {
        if !isCycle(cost[0], cost[1]) {
            makeBridge(cost[0], cost[1])
            res += cost.last!
        }
    }

    return res
}
