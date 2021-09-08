func checkMatch(_ game:[[Int]], _ table:[[Int]]) -> (Bool, Int) {
    var res = 0
    var gameList: [(Int, Int)] = [], tableList: [(Int, Int)] = []
    for row in 0..<game.count {
        for col in 0..<game.first!.count {
            if game[row][col] == 1 {
                gameList.append((row, col))
                res+=1
            }
            if table[row][col] == 1 {
                tableList.append((row, col))
            }
        }
    }

    if gameList.count != tableList.count {return (false, 0)}

    for idx in 0..<gameList.count-1 {
        if gameList[idx+1].0 - gameList[idx].0 != tableList[idx+1].0 - tableList[idx].0 || gameList[idx+1].1 - gameList[idx].1 != tableList[idx+1].1 - tableList[idx].1 {
            return (false, 0)
        }
    }
    return (true, res)
}

func makeKey(_ point:[(Int, Int)], _ len:Int, _ xy:(Int, Int)) -> [[Int]] {
    var res = [[Int]](repeating: [Int](repeating: 0, count: len), count: len)
    for (row, col) in point {
        res[row-xy.0][col-xy.1] = 1
    }
    return res
}

func rotate(_ block:[[Int]]) -> [[Int]] {
    let n = block.count - 1
    var rotated = [[Int]](repeating: [Int](repeating: 0, count: block.first!.count), count: block.count)
    for row in 0..<block.count {
        for col in 0..<block.count {
            let k = n - row
            rotated[col][k] = block[row][col]
        }
    }
    return rotated
}

func findBlock(_ board:[[Int]], _ target:Int, _ startpoint:(Int, Int)) -> ([[Int]], [[Int]]) {

    var board = board
    var queue = [startpoint], cursor = 0
    let dx = [1, -1, 0, 0], dy = [0, 0, 1, -1]
    board[startpoint.0][startpoint.1] = target == 0 ? 1:0
    var maxX = 0, maxY = 0, minX = board.count, minY = board.first!.count
    while cursor < queue.count {
        let now = queue[cursor]
        let x = now.0, y = now.1
        cursor+=1
        maxX = max(maxX, x)
        minX = min(minX, x)
        maxY = max(maxY, y)
        minY = min(minY, y)
        for i in 0..<4 {
            let nx = x + dx[i], ny = y + dy[i]

            if (0..<board.count).contains(nx) && (0..<board.first!.count).contains(ny) && board[nx][ny] == target {
                board[nx][ny] = target == 0 ? 1:0
                queue.append((nx, ny))
            }
        }

    }

    let res = makeKey(queue, max(maxX-minX+1, maxY-minY+1), (minX, minY))
    return (board, res)
}


func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    var boardList: [[[Int]]] = [], tableList: [[[Int]]] = []
    var gameBoard = game_board, tableBoard = table

    for row in 0..<gameBoard.count {
        for col in 0..<gameBoard.first!.count {
            if gameBoard[row][col] == 0 {
                let block = findBlock(gameBoard, 0, (row, col))
                boardList.append(block.1)
                gameBoard = block.0
            }
        }
    }

    for row in 0..<table.count {
        for col in 0..<table.first!.count {
            if tableBoard[row][col] == 1 {
                let block = findBlock(tableBoard, 1, (row, col))
                tableList.append(block.1)
                tableBoard = block.0
            }
        }
    }

    var res = 0
    while !boardList.isEmpty && !tableList.isEmpty {
        var nowTable = tableList.removeLast()

        for (idx, board) in boardList.enumerated() {
            var flag = false
            if board.count != nowTable.count || board.first!.count != nowTable.first!.count { continue }
            for _ in 0..<4 {
                let result = checkMatch(board, nowTable)
                if result.0 {
                    boardList.remove(at: idx)
                    res += result.1
                    flag = true
                    break
                }
                nowTable = rotate(nowTable)
            }
            if flag { break }
        }
    }

    return res
}
