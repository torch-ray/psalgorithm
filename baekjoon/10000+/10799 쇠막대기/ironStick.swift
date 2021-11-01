let S = readLine()!.map{$0}
var bars = 0, res = 0

for i in 0..<S.count {
    if S[i] == "(" {
        bars += 1
    } else {
        bars -= 1
        res += S[i-1] == "(" ? bars:1
    }
}
print(res)
