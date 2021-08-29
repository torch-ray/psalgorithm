let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NM.first!, M = NM.last!

func dfs(_ arr:[Int], _ res:[Int]) {
    
    if res.count == M {
        res.forEach {print($0, terminator: " ")}
        print()
        return
    }
    
    for num in arr where !res.contains(num) {
        dfs(arr, res+[num])
    }
}

dfs((1...N).map{$0}, [])
