let n = readLine()!.split{$0==" "}.map{Int(String($0))!}


func dfs(_ m:[Int]) {
    if m.count == n[1] {
        m.forEach{print($0, terminator: " ")}
        print()
        return
    }
    for i in 1...n[0] where m.last ?? 0 < i {
        dfs(m+[i])
    }
}

dfs([])
