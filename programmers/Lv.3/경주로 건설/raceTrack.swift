func bfs(_ board:[[Int]], _ start:Int) -> Int {
    var queue = [[0, 0, start, 0]]
    let n = board.count
    let (dx, dy) = ([1, -1, 0, 0], [0, 0, 1, -1])
    var road = board
    road[0][0] = 1

    var cursor = 0
    while cursor < queue.count {
        let nowQ = queue[cursor]
        let (x, y, dir) = (nowQ[0], nowQ[1], nowQ[2])
        cursor+=1

        for idx in 0..<4 {
            var money = nowQ[3]
            let (nx, ny) = (x+dx[idx], y+dy[idx])

            if (0..<n).contains(nx) && (0..<n).contains(ny) && road[nx][ny] != 1 {

                if idx == dir {
                    money += 100
                } else {
                    money += 600
                }

                if road[nx][ny] == 0 {
                    road[nx][ny] = money
                    queue.append([nx, ny, idx, money])
                } else if road[nx][ny] > money {
                    road[nx][ny] = money
                    queue.append([nx, ny, idx, money])
                }
            }
        }
    }
    return road[n-1][n-1]
}

func solution(_ board:[[Int]]) -> Int {
    return min(bfs(board, 0), bfs(board, 2))
}
