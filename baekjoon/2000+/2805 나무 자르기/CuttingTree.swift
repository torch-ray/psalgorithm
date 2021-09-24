let N = readLine()!.split{$0==" "}.map{Int(String($0))!}
let T = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted(by:>)
var s = 1, e = 2_000_000_000
var res = 0

while s<=e {
    let mid = (s+e)/2
    var sum = 0
    for H in T {
        if H <= mid {
            break
        }
        sum += (H-mid)
    }
    
    if sum >= N[1] {
        res = mid
        s = mid+1
    } else {
        e = mid-1
    }
}
print(res)
