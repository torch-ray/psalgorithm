func solution(_ n:Int, _ words:[String]) -> [Int] {
    var res:[Int] = []
    var word = [words.first!]

    for idx in 1..<words.count {
        if word.contains(words[idx]) {
            let turn = (idx+1)%n == 0 ? (idx+1)/n:((idx+1)/n)+1
            let wrong = (idx+1)%n == 0 ? n:(idx+1)%n
            res.append(contentsOf: [wrong, turn])
            break
        } else if words[idx-1].last! != words[idx].first {
            let turn = (idx+1)%n == 0 ? (idx+1)/n:((idx+1)/n)+1
            let wrong = (idx+1)%n == 0 ? n:(idx+1)%n
            res.append(contentsOf: [wrong, turn])
            break
        }
        word.append(words[idx])
    }

    return res.isEmpty ? [0,0]:res
}
