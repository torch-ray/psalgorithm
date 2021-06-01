func relocate(_ block:[[String]]) -> [[String]] {
    var copyBlock = block

    (0..<block.count).reversed().forEach { row in
        (0..<block.first!.count).reversed().forEach { col in
            if block[row][col] == "" {
                var saveRow = row
                var nowRow = row - 1

                while nowRow != -1 {
                    if copyBlock[nowRow][col] != "" && copyBlock[saveRow][col] == "" {
                        copyBlock[saveRow][col] = copyBlock[nowRow][col]
                        copyBlock[nowRow][col] = ""
                        saveRow-=1
                    }
                    nowRow-=1
                }
            }
        }
    }
    return copyBlock
}

func remove(_ block:[[String]]) -> ([[String]], Int) {
    var copyBlock = block
    var cnt = 0

    for i in 1..<block.count {
        for j in 1..<block.first!.count {
            let tmp = block[i][j]
            if tmp == block[i-1][j] && tmp == block[i][j-1] && tmp == block[i-1][j-1] && tmp != "" {
                copyBlock[i][j] = ""
                copyBlock[i-1][j] = ""
                copyBlock[i][j-1] = ""
                copyBlock[i-1][j-1] = ""
                cnt+=1
            }
        }
    }
    return (copyBlock, cnt)
}

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    let boards = board.map{$0.map{String($0)}}
    var res = remove(boards)

    while res.1 != 0 {
        let tmp = relocate(res.0)
        res = remove(tmp)
    }
    return res.0.flatMap{$0}.filter{$0==""}.count
}
