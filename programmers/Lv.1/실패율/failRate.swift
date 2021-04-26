func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var user = stages.count
    var fail = [Int](repeating: 0, count: N+1)
    
    stages.forEach { fail[$0-1]+=1 }
    
    var failRate = [Double]()
    for idx in 0..<N {
        if idx > 0 { user -= fail[idx-1] }
        failRate.append(Double(fail[idx])/Double(user))
    }
    
    var tmp = [(Int, Double)]()
    for (idx, val) in failRate.enumerated() {
        tmp.append((idx, val))
    }
    tmp.sort{ $0.1 > $1.1 }
    
    var res = [Int]()
    tmp.forEach {
        res.append($0.0+1)
    }
    
    return res
}
