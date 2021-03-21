func solution(_ s:String) -> String {
    let str = Array(s)
    var res = ""
    var idx = 0
    
    for i in str {
        if i == " " {
            res += " "
            idx = 0
            continue
        } else if idx%2==0 {
            res += i.uppercased()
        } else {
            res += i.lowercased()
        }
        idx+=1
    }
    return res
}
