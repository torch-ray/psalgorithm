let num = Int(readLine()!)!
let (dx, dy) = ([1, -1, 0, 0], [0, 0, 1, -1])

for _ in 0..<num {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (n, m, k) = (input[0], input[1], input[2])
    var map = [[Int]]()
    
    for _ in 0..<n {
        map.append([Int](repeating: 0, count: m))
    }
    
    func bfs(_ x:Int, _ y:Int) {
        var queue = [(x, y)]
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            for i in 0..<4 {
                let (nx, ny) = (x+dx[i], y+dy[i])
                if (0..<n).contains(nx) && (0..<m).contains(ny) && map[nx][ny] == 1 {
                    map[nx][ny] = 2
                    queue.append((nx, ny))
                }
            }
        }
    }
    

    var res = 0
    for _ in 0..<k {
        let info = readLine()!.split{$0==" "}.map{Int(String($0))!}
        let (row, col) = (info[0], info[1])
        map[row][col] = 1
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 1 {
                bfs(i, j)
                res+=1
            }
        }
    }
    print(res)
}
