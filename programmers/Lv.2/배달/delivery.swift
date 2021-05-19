func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var distance = [[Int]](repeating: [Int](repeating: 99999999, count: N), count: N)

    for i in 0..<N {
        distance[i][i] = 0
    }

    for i in road {
        distance[i[0]-1][i[1]-1] = min(i[2], distance[i[0]-1][i[1]-1])
        distance[i[1]-1][i[0]-1] = min(i[2], distance[i[1]-1][i[0]-1])
    }

    for k in 0..<N {
        for i in 0..<N {
            for j in 0..<N {
                distance[i][j] = min(distance[i][j], distance[i][k] + distance[k][j])
            }
        }
    }

    return distance.first!.filter{$0<=k}.count
}
