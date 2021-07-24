func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    
    if dist.last! >= n { return 1 }
    
    var record: [Set<[Int]>] = [[weak]]
    var dist = dist
    
    for cnt in 1...dist.count {
        if weak.count == cnt { return cnt }
        
        let movable = dist.removeLast()
        var notRepaired: Set<[Int]> = []
        
        for list in record[cnt-1] {
            for idx in 0..<list.count {
                
                let (s, e) = (list[idx], list[idx] + movable)
                let circle = max(-1, e-n)
                
                let impossible = list.filter {
                     return circle == -1 ? !((s...e).contains($0)) : !((s...n).contains($0) || (0...circle).contains($0))
                }
                
                if impossible.count == 0 { return cnt }
                notRepaired.insert(impossible)
            }
        }
        record.append(notRepaired)
    }
    
    return -1
}
