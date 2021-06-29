func solution(_ s:String) -> String {
    let strArr = s.map{$0.lowercased()}
    var res = ""

    for char in strArr {
        if res.isEmpty {
            res += char.uppercased()
        } else  {
            if res.last! == " " {
                res += char.uppercased()
            } else {
                res += char
            }
        }
    }

    return res
}
