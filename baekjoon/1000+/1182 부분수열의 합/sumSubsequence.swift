let N = readLine()!.split{$0==" "}.map{Int(String($0))!}
let A = readLine()!.split{$0==" "}.map{Int(String($0))!}
var cnt = 0

func dfs(_ idx:Int, _ sum:Int) {
    
    if idx == N[0] {
        return
    }
    
    let res = sum + A[idx]
    
    if res == N[1] {
        cnt += 1
    }
    
    dfs(idx+1, res)
    dfs(idx+1, res-A[idx])
}

dfs(0, 0)
print(cnt)
