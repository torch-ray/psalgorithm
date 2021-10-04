var D:[Int] = []

for _ in 0..<Int(readLine()!)! {
    let C = readLine()!.split{$0==" "}.map{String($0)}
    let command = C.first!
    var num = 0
    
    if C.count > 1 {
        num = Int(C.last!)!
    }
    
    switch command {
    case "push_front": D.insert(num, at: 0)
    case "push_back": D.append(num)
    case "pop_front": print(D.isEmpty ? -1:D.removeFirst())
    case "pop_back": print(D.isEmpty ? -1:D.removeLast())
    case "size": print(D.count)
    case "empty": print(D.isEmpty ? 1:0)
    case "front": print(D.isEmpty ? -1:D.first!)
    default: print(D.isEmpty ? -1:D.last!)
    }
}
