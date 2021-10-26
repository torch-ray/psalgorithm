while true {
    let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let N = NM[0], M = NM[1...].sorted()
    if N == 0 { break }
    func C(_ idx:Int, _ res:[String]) {
        
        if res.count == 6 {
            print(res.joined(separator: " "))
            return
        }
        
        for i in idx..<N {
            C(i+1, res+["\(M[i])"])
        }
    }

    C(0, [])
    print()
}
