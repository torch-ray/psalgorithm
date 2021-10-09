let arr = readLine()!.split{$0==" "}.map{String($0)}
var A = Array(arr.first!.reversed()).map{Int(String($0))!}
var B = Array(arr.last!.reversed()).map{Int(String($0))!}
let N = A.count > B.count ? A.count:B.count

var M = [Int](repeating: 0, count: N)

for i in 0..<A.count {
    M[i] += A[i]
}

for i in 0..<B.count {
    M[i] += B[i]
}

for i in 0..<N-1 {
    if M[i] >= 10 {
        M[i] = M[i]%10
        M[i+1] += 1
    }
}

if M[N-1] >= 10 {
    M[N-1] = M[N-1]%10
    M.append(1)
}

print(Array(M.reversed()).map{String($0)}.joined())
