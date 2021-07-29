func solution(_ a:[Int]) -> Int {
    var res = 2
    var (left, right) = (a.first!, a.last!)

    var isLeft = left > right ? true:false
    var (leftIndex, rightIndex) = (0, a.count-1)
    var cnt = 2

    while cnt < a.count {

        switch isLeft {

        case true:
            leftIndex+=1
            res += a[leftIndex] > left ? 0:1
            left = left < a[leftIndex] ? left:a[leftIndex]

        case false:
            rightIndex-=1
            res += a[rightIndex] > right ? 0:1
            right = right < a[rightIndex] ? right:a[rightIndex]

        }

        isLeft = left > right ? true:false
        cnt+=1
    }

    return res
}
