class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var total = 0
        
        for idx in 0..<prices.count-1 {
            if prices[idx+1] > prices[idx] {
                total += prices[idx+1] - prices[idx]
            }
        }
        
        return total
    }
}
