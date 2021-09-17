public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
    var res = [Int](repeating:0, count: N)
    var maxNum = 0, curMax = 0

    for operation in A {

        if operation == N+1 {
            curMax = maxNum
            continue
        }

        let index = operation-1

        if curMax > res[index] {
            res[index] = curMax
        }

        res[index] += 1
        maxNum = max(maxNum, res[index])
    }

    for index in res.indices {
        if res[index] < curMax {
            res[index] = curMax
        }
    }

    return res
}
