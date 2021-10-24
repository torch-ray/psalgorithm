class Tree {
    var node: String
    var left: String
    var right: String
    
    init(_ node: String, _ left: String, _ right: String) {
        self.node = node
        self.left = left
        self.right = right
    }
}

var tree:[String:Tree] = [:]
var S1 = "", S2 = "", S3 = ""

for _ in 0..<Int(readLine()!)! {
    let N = readLine()!.split{$0==" "}.map{String($0)}
    tree[N[0]] = Tree(N[0], N[1], N[2])
}

func dfs(_ node: String) {
    
    if node == "." {
        return
    }
    
    S1 += node
    dfs(tree[node]!.left)
    S2 += node
    dfs(tree[node]!.right)
    S3 += node
}

dfs("A")
print(S1)
print(S2)
print(S3)
