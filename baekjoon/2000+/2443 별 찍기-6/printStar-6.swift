let N = Int(readLine()!)!
var S = String(repeating: "*", count: 2*N+1)
for i in 0..<N {
    S.removeLast()
    S.removeLast()
    print(String(repeating: " ", count: i)+S)
}
