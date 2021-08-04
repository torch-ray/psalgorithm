import Foundation

public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
    
    guard A.count > 0 && K > 0 else { return A }
    
    for _ in 0..<K {
        A.insert(A.removeLast(), at: 0)
    }
    return A
}
