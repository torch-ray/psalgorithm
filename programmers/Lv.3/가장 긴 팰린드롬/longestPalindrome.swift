func solution(_ s:String) -> Int {
    var res = 0
    let arr:[Character] = Array(s)
    
    for i in 0..<arr.count {
        for j in stride(from: arr.count-i, to: res, by: -1) {
            var left = i
            var right = (i+j-1)
            while left <= right, arr[left] == arr[right] {
                left += 1
                right -= 1
            }
            
            if left > right {
                res = max(res, j)
                break
            }
        }
    }
    return res
}
