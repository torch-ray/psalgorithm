func solution(_ gems:[String]) -> [Int] {
    let uniqueCnt = Set(gems).count
    if uniqueCnt == 1 { return [1, 1]}
    var (s, e) = (0, 0)
    var res:[Int] = []
    var minVal = 999999999
    var jewerly:[String:Int] = [:]
    
    while s <= e {
        if jewerly.count >= uniqueCnt {
            jewerly[gems[s]]! -= 1
            if jewerly[gems[s]] == 0 {
                jewerly[gems[s]] = nil
            }
            s+=1
        } else if e == gems.count {
            break
        } else {
            if jewerly[gems[e]] == nil {
                jewerly[gems[e]] = 1
            } else {
                jewerly[gems[e]]? += 1
            }
            e+=1
        }
        
        if jewerly.count == uniqueCnt && (e-s) < minVal {
            minVal = (e-s)
            res = [s+1, e]
        }
    }
    return res
}
