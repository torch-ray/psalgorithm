func solution(_ x:Int) -> Bool {
    let strArr = Array(String(x))
    let sum = strArr.map{Int(String($0))!}.reduce(0,+)
    return x%sum == 0
}
