func dfs(_ q:[Int], _ row:Int, _ n:Int) -> Int {
    var cnt = 0, queen = q
    
    if n == row {
        return 1
    }
    
    for col in 0..<n {
        queen[row] = col
        var flag = 0
        for i in 0..<row {
            if queen[i] == queen[row] {
                break
            }
            if abs(queen[i]-queen[row]) == row - i {
                break
            }
            flag += 1
        }
        if flag == row {
            cnt += dfs(queen, row+1, n)
        }
    }
    return cnt
}
let n = Int(readLine()!)!
print(dfs([Int](repeating: 0, count: n), 0, n))
