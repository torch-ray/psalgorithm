var s:[String] = []

for _ in 0..<Int(readLine()!)! {
    let c = readLine()!.split{$0==" "}.map{String($0)}
    
    switch c[0] {
    case "push": s.append(c[1])
    case "pop": print(s.isEmpty ? "-1":s.removeLast())
    case "size": print(s.count)
    case "empty": print(s.isEmpty ? "1":"0")
    default: print(s.isEmpty ? "-1":s.last!)
    }
}
