func S(_ n:Int) -> [String] {
    if n == 1 {
        return ["*"]
    }
    
    let stars = S(n/3)
    var res:[String] = []
    
    for s in stars {
        res.append(String(repeating: s, count: 3))
    }
    
    for s in stars {
        res.append(s+String(repeating: " ", count: n/3)+s)
    }
    
    for s in stars {
        res.append(String(repeating: s, count: 3))
    }
    
    return res
}

let N = Int(readLine()!)!
print(S(N).joined(separator: "\n"))
