let N = Int(readLine()!)!
let A = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted(by: >)
let B = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()
var res = 0

for idx in 0..<N {
    res += A[idx] * B[idx]
}

print(res)
