func solution(_ a:[Int], _ b:[Int]) -> Int {
    var res = 0
    var a = a.sorted(), b = b.sorted()
    
    while !a.isEmpty && !b.isEmpty {
        if a.last! < b.last! {
            a.removeLast()
            b.removeLast()
            res += 1
        } else {
            a.removeLast()
        }
    }
    
    return res
}
