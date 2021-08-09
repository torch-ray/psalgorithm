class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        guard gas.reduce(0, +) >= cost.reduce(0, +) else { return -1 }
        
        var start = 0, fuel = 0
        
        for location in 0..<gas.count {
            if gas[location] + fuel < cost[location] {
                start = location+1
                fuel = 0
                continue
            }
            
            fuel += gas[location] - cost[location]
        }
        
        return start
    }
}
