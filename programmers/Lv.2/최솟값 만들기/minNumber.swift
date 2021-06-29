func solution(_ A:[Int], _ B:[Int]) -> Int {
    var res = 0
    let (A, B) = (A.sorted(), B.sorted(by:>))
   
    for i in 0..<A.count {
        res += A[i]*B[i]
    }
    
    return res
}
