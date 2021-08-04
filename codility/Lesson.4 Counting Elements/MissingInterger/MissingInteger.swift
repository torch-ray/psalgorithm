import Foundation

public func solution(_ A : inout [Int]) -> Int {
    var dict:[Int:Bool] = [:]
    var maxNum = 0

    for num in A {
        dict[num] = true
        maxNum = max(maxNum, num)
    }

    guard maxNum > 0 else { return 1 }

    for num in 1...maxNum {
        if num == maxNum {
            return maxNum+1
        }
        if dict[num] == nil {
            return num
        }
    }
    return -1
}
