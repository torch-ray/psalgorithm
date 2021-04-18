func solution(_ x:Int, _ n:Int) -> [Int64] {
    if x == 0 { return [Int64](repeating: 0, count: n) }
    var res = [Int64]()
    for number in stride(from: x, through: n*x, by: x) {
        res.append(Int64(number))
    }
    return res
}
