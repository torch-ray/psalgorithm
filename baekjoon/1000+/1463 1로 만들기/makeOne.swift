func s(_ n: Int) -> Int {
    if n <= 1 {
        return 0
    }
    return min(s(n/3)+n%3, s(n/2)+n%2)+1
}
print(s(Int(readLine()!)!))
