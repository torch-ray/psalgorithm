public func solution(_ A : inout [Int]) -> Int {
    var dict: [Int: Int] = [:]
    for num in A {
        dict[num] = (dict[num] ?? 0) + 1
    }

    for (key, val) in dict {
        if val % 2 == 1 {
            return key
        }
    }
    return -1
}
