public func solution(_ A : inout [Int]) -> Int {
    var prev: Int?, profit = 0

    for price in A {

        if prev == nil {
            prev = price
            continue
        }

        profit = max(profit, price - prev!)
        prev = min(prev!, price)
    }

    return profit
}
