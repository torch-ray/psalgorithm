func solution(_ n:Int) -> String {
    var res = ""
    for i in 0..<n {
        if i%2==0 {res+="수"}
        else {res+="박"}
    }
    return res
}
