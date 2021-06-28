func solution(_ s:String) -> Bool {
    var (open, close) = (0, 0)
    
    for char in s {
        switch char {
        case "(": open+=1
        default: close+=1
        }
        if close > open { break }
    }
    return open == close
}
