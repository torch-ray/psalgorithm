func solution(_ a:Int, _ b:Int) -> Int64 {
    return Int64(a + b) * Int64(max(a, b) - min(a, b) + 1) / Int64(2)
}
