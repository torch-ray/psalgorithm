func solution(_ strings:[String], _ n:Int) -> [String] {
    var str = [String]()
    for i in 0..<strings.count {
        var tmp = Array(strings[i])
        tmp.insert(tmp[n], at: 0)
        str.append(String(tmp))
    }
    str.sort()
    
    for i in 0..<str.count {
        str[i].removeFirst()
    }
    return str
}
