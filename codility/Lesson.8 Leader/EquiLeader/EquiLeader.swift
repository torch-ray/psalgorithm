public func solution(_ A : inout [Int]) -> Int {
    var dict:[Int:Int] = [:]
    var leader = 0

    for number in A {
        dict[number] = (dict[number] ?? 0)+1
        if dict[number]! > A.count/2 {
            leader = number
            break
        }
    }

    var frequency = [Int](repeating:0, count: A.count)

    for (idx, num) in A.enumerated() {

        if idx == 0 {
            if num == leader {
                frequency[idx]+=1
            }
            continue
        }

        if num == leader {
            frequency[idx] = frequency[idx-1]+1
        } else {
            frequency[idx] = frequency[idx-1]
        }
    }
    
    var res = 0
    for idx in 0..<frequency.count-1 {
        let firstCnt = frequency[idx]
        let secondCnt = frequency.last! - firstCnt
        let firstChk = ((idx+1)/2)+1
        let secondChk = ((A.count - (idx+1))/2)+1

        if firstCnt >= firstChk && secondCnt >= secondChk {
            res += 1
        }
    }

    return res
}
