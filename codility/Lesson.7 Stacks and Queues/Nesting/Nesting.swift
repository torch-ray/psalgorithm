public func solution(_ S : inout String) -> Int {
    var open = 0, close = 0

    for char in S {
        if char == "(" {
            open += 1
        } else {
            close += 1
        }

        if close > open {
            return 0
        }
    }

    return open == close ? 1:0
}
