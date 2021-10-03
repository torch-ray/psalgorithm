for _ in 0..<Int(readLine()!)! {
    let N = readLine()!.split{$0==" "}.map{Int(String($0))!}
        
    var P1 = readLine()!.split{$0==" "}.map{Int(String($0))!}
    var T = (0..<P1.count).map{Int($0)}
    
    let P2 = P1.sorted(by: >)
    
    var cursor = 0
    while P1 != P2 {
        if P1[cursor] < P1[(cursor+1)...].max()! {
            P1.append(P1.remove(at: cursor))
            T.append(T.remove(at: cursor))
        } else {
            cursor += 1
        }
    }
    
    print(T.firstIndex(of: N.last!)!+1)
}

