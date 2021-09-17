public func solution(_ A : inout [Int]) -> Int {
    var dict:[Int:Int] = [:]

    for (idx, number) in A.enumerated() {
        dict[number] = (dict[number] ?? 0)+1
        if dict[number]! > A.count/2 {
            return idx
        }
    }

    return -1
}
