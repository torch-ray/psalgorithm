let N = readLine()!.split{$0==" "}.map{Int(String($0))!}
let S = readLine()!.split{$0==" "}.map{String($0)}.sorted()
let A: Set<Character> = ["a", "e", "i", "o", "u"]

func dfs(_ res:String, _ idx:Int) {
    
    if res.count == N[0] {
        var c = 0, v = 0
        for char in res {
            if A.contains(char) {
                v+=1
            } else {
                c+=1
            }
        }
        if c >= 2 && v >= 1 {
            print(res)
        }
        return
    }
    
    if idx == N[1] {
        return
    }
    
    for i in idx..<N[1] {
        dfs(res+S[i], i+1)
    }
}

dfs("", 0)
