public func solution(_ X : Int, _ A : inout [Int]) -> Int {
    var positions: Set<Int> = []

    for (sec, position) in A.enumerated() where !positions.contains(position) {
        positions.insert(position)
        if positions.count == X {
            return sec
        }
    }

    return -1
}
