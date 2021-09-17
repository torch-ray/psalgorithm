public func solution(_ H : inout [Int]) -> Int {
    var stack:[Int] = []
    var res = 0

    for height in H {

        while !stack.isEmpty && stack.last! > height {
            stack.removeLast()
        }

        if stack.isEmpty || stack.last! < height {
            res += 1
            stack.append(height)
        }
    }

    return res
}
