import Foundation

let N = Int(readLine()!)!
var K:[Int:Int] = [:], sum = 0, M:[Int] = []

for _ in 0..<N {
    let num = Int(readLine()!)!
    K[num] = (K[num] ?? 0) + 1
    sum += num
    M.append(num)
}
let S = K.sorted{$0.key < $1.key}
let O = S.filter{$0.value == K.values.max()}
M.sort()

print(Int(round(Double(sum)/Double(N))))
print(M[N/2])
print(O.count == 1 ? O[0].key:O[1].key)
print(M.last!-M.first!)
