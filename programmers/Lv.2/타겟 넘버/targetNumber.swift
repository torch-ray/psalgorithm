func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    var cnt = 0
    
    func dfs(_ index:Int, _ sum:Int) {
        if index == numbers.count {
            if sum == target {
                cnt += 1
            }
            return
        } else {
            dfs(index+1, sum+numbers[index])
            dfs(index+1, sum-numbers[index])
        }
    }
    
    dfs(0, 0)
    return cnt
}
