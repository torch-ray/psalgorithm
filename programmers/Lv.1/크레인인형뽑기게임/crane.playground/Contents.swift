import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var ans = [Int]()
    var boards = board
    var cnt = 0
    for i in moves {
        for j in 0..<boards.count {
            if boards[j][i-1] != 0 {
                ans.append(boards[j][i-1])
                boards[j][i-1] = 0
                
                if ans.count > 1 {
                    if ans[ans.endIndex-1] == ans[ans.endIndex-2] {
                        ans.popLast()
                        ans.popLast()
                        cnt+=2
                    }
                }
                break
            }
        }
    }
    return cnt
}
