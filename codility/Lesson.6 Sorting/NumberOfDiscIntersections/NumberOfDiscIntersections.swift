import Foundation

public func solution(_ A : inout [Int]) -> Int {

    var list:[(Int, Int)] = []
    
    for (idx, num) in A.enumerated() {
        list.append((idx-num, -1))
        list.append((idx+num, 1))
    }
    
    list.sort { $0.0 != $1.0 ? $0.0 < $1.0 : $0.1 < $1.1 }
    
    var res = 0, open = 0
    for tuple in list {
        if tuple.1 == 1 {
            open -= 1
        } else {
            res += open
            open += 1
        }
    }
    
    return res > 10_000_000 ? -1:res
}
