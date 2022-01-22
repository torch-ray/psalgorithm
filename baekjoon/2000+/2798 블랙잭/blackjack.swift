let n = readLine()!.split{$0==" "}.map{Int(String($0))!}
let m = readLine()!.split{$0==" "}.map{Int(String($0))!}
var res = 0

func dfs(_ s:Int, _ sum:Int, _ cnt:Int) {
    
    if sum > n[1] {
        return
    }
    
    if cnt == 3 {
        res = n[1]-sum < n[1]-res ? sum: res
        return
    }
    
    if s == n[0] {
        return
    }
    
    dfs(s+1, sum+m[s], cnt+1)
    dfs(s+1, sum, cnt)
}

dfs(0, 0, 0)
print(res)
