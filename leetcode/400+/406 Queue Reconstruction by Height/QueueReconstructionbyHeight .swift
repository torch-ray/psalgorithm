class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        let queue = people.sorted { $0[0] != $1[0] ? $0[0] > $1[0] : $0[1] < $1[1] }
        var reconstructed: [[Int]] = []
        
        for info in queue {
            reconstructed.insert(info, at: info[1])
        }
        
        return reconstructed
    }
}
