func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    let INF = 999999999
    var distance = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)

    for i in 0..<n {
        distance[i][i] = 0
    }

    for fare in fares {
        let (a, b, money) = (fare[0]-1, fare[1]-1, fare[2])
        distance[a][b] = money
        distance[b][a] = money
    }

    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                distance[i][j] = min(distance[i][j], distance[i][k] + distance[k][j])
            }
        }
    }

    var res = INF
    for k in 0..<n {
        res = min(res, distance[s-1][k] + distance[k][a-1] + distance[k][b-1])
    }

    return res
}
