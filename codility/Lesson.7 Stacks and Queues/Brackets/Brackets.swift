import Foundation

public func solution(_ S : inout String) -> Int {
    guard S.count > 0 else { return 1 }
    guard S.count % 2 != 1 else  { return 0 }
    
    var stack: [Character] = []
    let open: [Character] = ["(", "{", "["]
    let close: [Character] = [")", "}", "]"]
    
    for char in S {
        if stack.isEmpty {
            if open.contains(char) {
                stack.append(char)
            } else {
                return 0
            }
        } else {
            if open.contains(char) {
                stack.append(char)
            } else {
                if open.firstIndex(of: stack.last!) == close.firstIndex(of: char) {
                    stack.removeLast()
                } else {
                    return 0
                }
            }
        }
    }
    return stack.isEmpty ? 1:0
}
