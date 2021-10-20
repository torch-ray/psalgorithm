let N = readLine()!
var M = N.split{$0=="-"}.map{String($0)}, S = 0
for idx in 0..<M.count {
    let num = M[idx].split{$0=="+"}.map{String($0)}
    var sum = 0
    
    if num.count > 1 { sum = num.map{Int($0)!}.reduce(0, +) }
    else { sum = Int(M[idx])! }
    
    if idx == 0 { S += sum }
    else { S -= sum }
}

print(S)
