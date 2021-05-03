func solution(_ p:String) -> String {
    if p.count < 1 { return "" }
    var count = 0, index = p.startIndex

    repeat {
        count += p[index] == "(" ? 1:-1
        index = p.index(after: index)
    }while count != 0

    var u = p[..<index], v = p[index...]

    if u.first! == "(" {
        return u + solution(String(v))
    } else {
        u.removeLast()
        u.removeFirst()
        return "(\(solution(String(v))))" + u.map{$0=="(" ? ")":"("}.joined()
    }
}
