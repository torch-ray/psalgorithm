import Foundation

public func binary(_ num: Int) -> [String] {
    var res = "", num = num
    
    while num > 0 {
        res += "\(num%2)"
        num /= 2
    }
    
    return res.reversed().map{String($0)}
}

public func solution(_ N : Int) -> Int {
    let binArr = binary(N)
    var cnt = 0, res = 0
    
    for char in binArr {
        if char == "0" {
            cnt += 1
        } else {
            res = max(res, cnt)
            cnt = 0
        }
    }
    return res
}
