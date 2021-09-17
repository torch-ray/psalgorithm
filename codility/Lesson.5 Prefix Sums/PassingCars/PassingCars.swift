public func solution(_ A : inout [Int]) -> Int {
    var res = 0, zeroCount = 0

    for direction in A {

        if direction == 0 {
            zeroCount += 1
            continue
        }

        res += zeroCount
    }

    return res > 1_000_000_000 ? -1:res
}
