func solution(_ citations:[Int]) -> Int {
    var h = 0
    for (idx, val) in citations.sorted(by: >).enumerated() {
        if (idx+1) <= val {
            h = idx+1
        }
    }
    return h
}
