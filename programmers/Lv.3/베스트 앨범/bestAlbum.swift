func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var musicInfo:[String:[Int]] = [:]
    var plays = plays
    var res:[Int] = []
    
    for idx in 0..<genres.count {
        if musicInfo[genres[idx]] == nil {
            musicInfo[genres[idx]] = [plays[idx]]
        } else {
            musicInfo[genres[idx]]?.append(plays[idx])
        }
    }
    
    for value in musicInfo.values.sorted(by: { $0.reduce(0, +) > $1.reduce(0, +)}) {
        var tmp = value.sorted(by: >)
        while tmp.count > 2 {
            tmp.removeLast()
        }
        for key in tmp {
            let index = plays.firstIndex(of: key)!
            res.append(index)
            plays[index] = 0
        }
    }
    return res
}
