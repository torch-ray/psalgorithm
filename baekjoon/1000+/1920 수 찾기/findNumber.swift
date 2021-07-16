let n = Int(readLine()!)!
let a = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()
let m = Int(readLine()!)!
let b = readLine()!.split{$0==" "}.map{Int(String($0))!}

for num in b {
    var (s, e) = (0, a.count-1)
    var flag = false
    while s<=e, e<a.count {
        let mid = (s+e)/2
        if a[mid] == num {
            flag = true
            print(1)
            break
        } else {
            if a[mid] > num {
                e = mid-1
            } else {
                s = mid+1
            }
        }
    }
    if !flag { print(0) }
}
