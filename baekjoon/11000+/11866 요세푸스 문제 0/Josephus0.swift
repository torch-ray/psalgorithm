let NK = readLine()!.split{$0==" "}.map{Int(String($0))!}
let K = NK[1]-1
var N = (1...NK[0]).map{$0}, P = K
var S = "<"

while true {
    S+="\(N[P%N.count])"
    N.remove(at: P%N.count)
    if N.isEmpty {break}
    S+=", "
    P = (P+K)%N.count
}
S+=">"
print(S)
