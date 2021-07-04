func isChangable(_ now:String, _ target:String) -> Bool {
    var cnt = 0
    for i in 0..<now.count {
        let index = now.index(now.startIndex, offsetBy: i)
        if now[index] != target[index] {
            cnt+=1
        }
    }
    return cnt == 1
}

func dfs(_ begin:String, _ target:String, _ words:[String], _ cnt:Int) -> Int {

    if begin == target {
        return cnt
    }

    var minCnt:[Int] = []

    for idx in 0..<words.count {
        if isChangable(begin, words[idx]) {
            var newWords = words
            let changed = newWords.remove(at: idx)
            let res = dfs(changed, target, newWords, cnt+1)
            if res != 0 { minCnt.append(res) }
        }
    }

    return minCnt.min() ?? 0
}


func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) { return 0 }
    return dfs(begin, target, words, 0)
}
