public func solution(_ A : inout [Int]) -> Int {
    var distinct: Set<Int> = []

    for number in A where !distinct.contains(number) {
        distinct.insert(number)
    }

    return distinct.count
}
