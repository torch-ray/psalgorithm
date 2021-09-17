public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
    var stack:[(Int, Int)] = []

    for idx in A.indices {

        if stack.isEmpty {
            stack.append((A[idx], B[idx]))
            continue
        }

        if stack.last!.1 == B[idx] {
            stack.append((A[idx], B[idx]))
            continue
        }

        if stack.last!.1 == 0 {
            stack.append((A[idx], B[idx]))
            continue
        }

        if stack.last!.0 > A[idx] {
            continue
        }
        
        while !stack.isEmpty && stack.last!.0 < A[idx] && stack.last!.1 != B[idx] {
            stack.removeLast()
        }
        
        if stack.isEmpty || stack.last!.1 == B[idx] {
            stack.append((A[idx], B[idx]))
        }
    }

    return stack.count
}
