var N = Int(readLine()!)!
var Q = (1...N).map{$0}

var cursor = 0
while cursor < N-1 {
    cursor += 2
    Q.append(Q[cursor-1])
    N+=1
}

print(Q[cursor])
