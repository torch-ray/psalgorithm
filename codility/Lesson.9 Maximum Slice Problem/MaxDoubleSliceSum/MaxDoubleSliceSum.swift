public func solution(_ A : inout [Int]) -> Int {
    if A.count == 3 { return 0 }

    var leftMax = [Int](repeating:0, count: A.count)
    var rightMax = [Int](repeating:0, count: A.count)

    for idx in 1..<A.count-1 {
        leftMax[idx] = max(leftMax[idx-1]+A[idx], 0)
    }

    for idx in stride(from: A.count-2, to: 0, by: -1) {
        rightMax[idx] = max(rightMax[idx+1]+A[idx], 0)
    }

    var maxSliceSum = 0

    for idx in 1..<A.count-1 {
        maxSliceSum = max(maxSliceSum, leftMax[idx-1] + rightMax[idx+1])
    }

    return maxSliceSum
}
