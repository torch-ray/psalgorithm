func solution(_ s:String) -> Int{
    var res = [String]()
    
    for i in s {
        if res.isEmpty {
            res.append(String(i))
        } else {
            if res.last! == String(i) {
                res.removeLast()
            } else {
                res.append(String(i))
            }
        }
    }
    return res.isEmpty ? 1:0
}
