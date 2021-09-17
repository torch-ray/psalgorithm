public func solution(_ A : inout [Int]) -> Int {
    var res: Set<Int> = [], maxNum = 0

    for number in A  where number > 0 {
        res.insert(number)
        maxNum = max(maxNum, number)
    }

    guard maxNum > 0 else { return 1 }

    for number in 1...maxNum where !res.contains(number) {
        return number
    }

    return maxNum+1
}
