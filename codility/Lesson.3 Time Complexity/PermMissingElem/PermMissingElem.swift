public func solution(_ A : inout [Int]) -> Int {
    var res = 0

    for (num1, num2) in A.enumerated() {
        res ^= num1+1
        res ^= num2
    }

    res ^= A.count+1

    return res
}
