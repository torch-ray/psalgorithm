func move(_ x:Int, _ y:Int, _ board:[[Int]], _ key:[[Int]], _ lock:[[Int]]) -> Bool{
    var board = board
    
    let xstart = (lock.count - key.count + x)
    let ystart = (lock.count - key.count + y)
    
    var x = 0
    for row in xstart..<(xstart + key.count){
        var y = 0
        for col in ystart..<(ystart + key.count){
            board[row][col] += key[x][y]
            y += 1
        }
        x += 1
    }
    return isRightKey(board, lock)
}

func isRightKey(_ board:[[Int]], _ lock:[[Int]]) -> Bool {
    for row in lock.count..<(lock.count*2) {
        for col in lock.count..<(lock.count*2) {
            if board[row][col] == 2 || board[row][col] == 0 {
                return false
            }
        }
    }
    return true
}

func rotate(_ key:[[Int]]) -> [[Int]] {
    let n = key.count-1
    var res = [[Int]](repeating: [Int](repeating: 0, count: key.count), count: key.count)
    
    for i in 0..<key.count {
        for j in 0..<key.count {
            let k = n-i
            res[j][k] = key[i][j]
        }
    }
    return res
}



func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var board = [[Int]](repeating: [Int](repeating: 0, count: lock.count*3), count: lock.count*3)
    var key = key
    
    for row in lock.count..<(lock.count*2) {
        for col in lock.count..<(lock.count*2) {
            board[row][col] = lock[row-lock.count][col-lock.count]
        }
    }
    
    if isRightKey(board, lock) { return true }
    let n = key.count-1
    
    for _ in 0..<4 {
        for row in 1...(lock.count+n) {
            for col in 1...(lock.count+n) {
                if move(row, col, board, key, lock) {
                    return true
                }
            }
        }
        key = rotate(key)
    }
    return false
}
