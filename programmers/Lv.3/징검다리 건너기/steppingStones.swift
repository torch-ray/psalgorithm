func solution(_ stones:[Int], _ k:Int) -> Int {
    var res = 0
    var (left, right) = (1, stones.max()!)

    while left <= right {
        var zeroCount = 0
        let mid = (left+right)/2
        var flag = true

        for stone in stones {
            if stone < mid {
                zeroCount += 1

                if zeroCount == k {
                    flag = false
                    break
                }
            } else {
                zeroCount = 0
            }
        }

        if flag {
            res = max(res, mid)
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return res
}
