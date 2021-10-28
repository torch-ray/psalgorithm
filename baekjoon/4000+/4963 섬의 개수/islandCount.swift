while true {
    let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let N = NM[1], M = NM[0]
    if (N, M) == (0, 0) { break }
    
    var L:[[Int]] = []
    for _ in 0..<N {
        L.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
    }
    
    var res = 0
    let dx = [-1, -1, -1, 0, 0, 1, 1, 1], dy = [-1, 0, 1, -1, 1, -1, 0, 1]
    func S(_ row:Int, _ col:Int) {
        
        let (x, y) = (row, col)
        
        for i in 0..<8 {
            let (nx, ny) = (x+dx[i], y+dy[i])
            
            if (0..<N).contains(nx) && (0..<M).contains(ny) && L[nx][ny] == 1 {
                L[nx][ny] = 0
                S(nx, ny)
            }
        }
    }
    
    for row in 0..<N {
        for col in 0..<M {
            if L[row][col] == 1 {
                L[row][col] = 0
                S(row, col)
                res+=1
            }
        }
    }
    print(res)
}
