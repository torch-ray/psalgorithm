func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let maxTime = times.max()! * n
    
    var (left, right) = (0, maxTime)
    var mid = 0
    var res = 0
    
    while left <= right {
        mid = (left+right)/2
        let availableCount = times.reduce(0){ $0 + mid/$1 }
        
        if availableCount >= n {
            res = mid
            right = mid-1
        } else {
            left = mid+1
        }
    }
    return Int64(res)
}
