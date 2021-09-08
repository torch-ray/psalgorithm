func solution(_ word:String) -> Int {
    let dict = ["A", "E", "I", "O", "U"]
    var list:[String] = []
    
    func dfs(_ res:String) {
        list.append(res)
        
        if res.count == 5 { return }
        
        for i in 0..<5 {
            dfs(res+dict[i])
        }
    }
    
    dfs("")
    
    return list.firstIndex(of: word)!
}
