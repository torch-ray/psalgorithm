import Foundation

public func solution(_ X : Int, _ A : inout [Int]) -> Int {
    
    var dict:[Int:Bool] = [:]
    
    for num in 1...X {
        dict[num] = true
    }

    for (idx, num) in A.enumerated() {
        dict[num] = nil
        if dict.count == 0 {
            return idx
        }
    }
    return -1
}
