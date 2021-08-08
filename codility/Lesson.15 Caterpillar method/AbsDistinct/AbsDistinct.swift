import Foundation

public func solution(_ A : inout [Int]) -> Int {
    var dict:[Int:Bool] = [:]

    for num in A {
        dict[abs(num)] = true
    }

    return dict.count
}
