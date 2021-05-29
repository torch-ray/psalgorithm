func solution(_ n:Int) -> [Int] {
    var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var (num, row, col, cycle, length) = (1, -1, 0, 0, n)
    
    while length > 0 {
        switch cycle {
        case 0:
            for _ in 0..<length {
                row+=1
                res[row][col]=num
                num+=1
            }
            cycle=1
            length-=1
        case 1:
            for _ in 0..<length {
                col+=1
                res[row][col]=num
                num+=1
            }
            cycle=2
            length-=1
        case 2:
            for _ in 0..<length {
                row-=1
                res[row][col]=num
                num+=1
            }
            cycle=0
            col-=length
            length-=1
        default:
            break
        }
    }
    return res.flatMap{$0.filter{$0 != 0}}
}
