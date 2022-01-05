let n = Int(readLine()!)!

for i in 0..<n {
    print(String(repeating: " ", count: i)+String(repeating: "*", count: n-i))
}

