func solution(_ s:String) -> Bool {
    let res = s.filter{ $0.isNumber }.count
    return res != s.count ? false: res == 4 ? true : res == 6 ? true : false
}
