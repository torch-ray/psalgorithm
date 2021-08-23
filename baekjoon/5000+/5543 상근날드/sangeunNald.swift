var n = 2_000, m = 2_000

for _ in 0..<3 {
    n = min(n, Int(readLine()!)!)
}

for _ in 0..<2 {
    m = min(m, Int(readLine()!)!)
}

print(n+m-50)
