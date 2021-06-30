func solution(_ N:Int, _ number:Int) -> Int {
    var res = -1

    if N == number { return 1 }

    func dfs(_ depth:Int, _ now:Int) {
        if depth > 8 { return }
        if now == number && (res == -1 || res > depth) {
            res = depth
            return
        }

        var next = 00
        for cnt in 0..<8 {
            next = (next*10) + N
            let numCnt = depth + 1 + cnt
            if res != -1 && res < numCnt { break }
            dfs(numCnt, now+next)
            dfs(numCnt, now-next)
            dfs(numCnt, now*next)
            dfs(numCnt, now/next)
        }
    }

    dfs(0, 0)
    return res
}
