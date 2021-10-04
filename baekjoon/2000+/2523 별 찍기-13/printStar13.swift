let N = Int(readLine()!)!
for n in 1...N {
    print(String(repeating: "*", count: n))
}

for n in stride(from: N-1, through: 1, by: -1) {
    print(String(repeating: "*", count: n))
}
