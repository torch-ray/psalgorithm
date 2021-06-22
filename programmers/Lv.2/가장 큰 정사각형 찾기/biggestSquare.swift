func solution(_ board:[[Int]]) -> Int{
    if board.count == 1 { return 1 }
    var board = board
    var res = 0
    for row in 1..<board.count {
        for col in 1..<board.first!.count {
            if board[row][col] == 1 {
                board[row][col] = min(board[row-1][col], board[row][col-1], board[row-1][col-1])+1
                res = max(res, board[row][col])
            }
        }
    }
    return res * res
}
