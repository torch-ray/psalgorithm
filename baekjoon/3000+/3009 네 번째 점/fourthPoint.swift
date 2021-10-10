var X = 0, Y = 0
for _ in 0..<3 {
    let N = readLine()!.split{$0==" "}.map{Int(String($0))!}
    X ^= N[0]
    Y ^= N[1]
}
print(X, Y)
