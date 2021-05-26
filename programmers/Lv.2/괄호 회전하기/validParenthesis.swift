func isValid(_ s:[String]) -> Bool {
    
    let (open, close) = (["[", "(", "{"], ["]", ")", "}"])
    var res:[String] = []
    
    for i in s {
        
        if res.isEmpty {
            if open.contains(i) {
                res.append(i)
            } else {
                return false
            }
        } else {
            if open.contains(i) {
                res.append(i)
            } else if open.firstIndex(of: res.last!)! == close.firstIndex(of: i)! {
                res.removeLast()
            }
        }
    }
    return res.count == 0 ? true:false
}

func solution(_ s:String) -> Int {
    var s = s.map{String($0)}
    var cnt = 0
    for _ in 0..<s.count {
        s.append(s.removeFirst())
        if isValid(s) { cnt += 1}
    }
    
    return cnt
}
