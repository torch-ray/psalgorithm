func pow(_ num:Int) -> Int {
    var res = 1
    for _ in 0..<num {
        res *= 2
    }
    return res
}

func dec(_ arr:[Int]) -> Int64 {
    var res = 0
    for (idx, val) in arr.enumerated() {
        res += val * pow(idx)
    }
    return Int64(res)
}

func bit(_ num:Int64) -> [Int] {
    var res:[Int] = []
    var nums = Int(num)
    while nums > 0 {
        res.append(nums%2)
        nums/=2
    }

    if res.count == res.reduce(0,+) {
        res.removeLast()
        res.append(contentsOf: [0, 1])
    } else {
        for i in 0..<res.count {
            if res[i] == 0 {
                res[i] = 1
                res[i-1] = 0
                break
            }
        }
    }
    return res
}

func solution(_ numbers:[Int64]) -> [Int64] {
    var res:[Int64] = []
    for i in numbers {
        if i%2 == 0 {
            res.append(i+1)
        } else {
            res.append(dec(bit(i)))
        }
    }
    return res
}
