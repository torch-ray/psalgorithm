import Foundation

public func solution(_ A : inout [Int]) -> Int {

    guard A.count > 2 else { return 0 }

    let a = A.sorted()
    var list:[Int] = []

    for idx in 0..<A.count-2 {
        list.append(a[idx]+a[idx+1])
    }
    
    for idx in 0..<list.count {
        if list[idx] > a[idx+2] {
            return 1
        }
    }

    return 0
}
