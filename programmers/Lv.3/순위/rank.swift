func solution(_ n:Int, _ results:[[Int]]) -> Int {
    let impossible = 999999999
    var rank = [[Int]](repeating: [Int](repeating: impossible, count: n), count: n)

    for idx in 0..<n {
        rank[idx][idx] = 0
    }

    for result in results {
        rank[result[0]-1][result[1]-1] = 1
    }

    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                rank[i][j] = min(rank[i][j], rank[i][k]+rank[k][j])
            }
        }
    }

    var res = [Bool](repeating: true, count: n)
    for a in 0..<n {
        for b in 0..<n {
            if a == b { continue }
            if rank[a][b] == impossible && rank[b][a] == impossible {
                res[a] = false
                break
            }
        }
    }

    return res.filter{$0}.count
}
