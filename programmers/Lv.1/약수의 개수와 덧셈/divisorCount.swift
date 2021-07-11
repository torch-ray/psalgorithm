func divisor(_ num:Int) -> Int {
    var cnt = 0
    for divisor in 1...num {
        if num % divisor == 0 {
            cnt += 1
        }
    }
    return cnt
}

func solution(_ left:Int, _ right:Int) -> Int {
    var res = 0

    for num in left...right {
        res += divisor(num) % 2 == 0 ? num:-num
    }

    return res
}
