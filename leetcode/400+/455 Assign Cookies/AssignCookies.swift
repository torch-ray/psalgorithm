class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let greedy = g.sorted(), size = s.sorted()
        
        var child = 0, cnt = 0
        
        while child < g.count && cnt < s.count {
            if size[cnt] >= greedy[child] {
                child += 1
            }
            cnt += 1
        }
        
        return child
    }
}
