func solution(_ s:String) -> String {
    return String(Array(s)[(s.count-1)/2...s.count/2])
}
