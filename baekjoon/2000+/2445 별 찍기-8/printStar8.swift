let N = Int(readLine()!)!
var S = [String](repeating: " ", count: 2*N)

for i in 1..<(2*N) {
    
    if i <= N {
        S[i-1] = "*"
        S[2*N-i] = "*"
    } else {
        S[i-1] = " "
        S[2*N-i] = " "
    }
    
    print(S.joined())
}
