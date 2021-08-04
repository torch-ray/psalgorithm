import Foundation

public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
    var (maxNum, curMax) = (0, 0)
    var res = [Int](repeating: 0, count: N)

    for num in A {
        let index = num-1

        if N+1 == num {
            curMax = maxNum
        } else {
            if curMax > res[index] {
                res[index] = curMax
            }
            res[index]+=1
            maxNum = max(maxNum, res[index])
        }
    }

    for idx in 0..<N {
        if res[idx] < curMax {
            res[idx] = curMax
        }
    }

    return res
}
