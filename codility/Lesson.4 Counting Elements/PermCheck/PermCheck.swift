public func solution(_ A : inout [Int]) -> Int {
    var permutation: Set<Int> = []
    
    for number in A {
        
        if number > A.count {
            return 0
        }
        
        if permutation.contains(number) {
            return 0
        }
        
        permutation.insert(number)
    }
    
    return permutation.count == A.count ? 1:0
}
