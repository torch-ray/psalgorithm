public func solution(_ A : inout [Int]) -> Int {
    var res = 0

    for number in A {
        res ^= number
    }

    return res
}
