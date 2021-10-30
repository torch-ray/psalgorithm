let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NM[0], M = NM[1]

var L:[Int] = [], maxL = 0
for _ in 0..<N {
    let num = Int(readLine()!)!
    maxL = max(maxL, num)
    L.append(num)
}

var s = 0, e = maxL

while s <= e {
    let mid = (s+e)/2
    guard mid != 0 else {
        e+=1
        continue
    }
    let cnt = L.map{$0/mid}.reduce(0, +)
    
    if cnt < M {
        e = mid-1
    } else {
        s = mid+1
    }
}

print(e)
