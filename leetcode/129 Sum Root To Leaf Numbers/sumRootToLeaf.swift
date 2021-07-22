//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var res = 0
        
        func dfs(_ node: TreeNode, sum: Int) {
            let nowSum = sum*10 + node.val
            
            if node.left == nil && node.right == nil {
                res += nowSum
                return
            }
            
            if let left = node.left {
                dfs(left, sum: nowSum)
            }
            
            if let right = node.right {
                dfs(right, sum: nowSum)
            }
        }
        
        dfs(root, sum: 0)
        return res
    }
}
