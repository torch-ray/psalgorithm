class Node {
    var key: Int
    var x: Int
    var left: Node?
    var right: Node?

    init(_ key: Int, _ x:Int) {
        self.key = key
        self.x = x
    }
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {

    var node: Node?
    var preorder: [Int] = []
    var postorder: [Int] = []

    func binaryTree(_ key:Int, _ x:Int, _ next: inout Node?) {
        if next == nil {
            next = Node(key, x)
            return
        }
        if next!.x > x {
            binaryTree(key, x, &next!.left)
        } else {
            binaryTree(key, x, &next!.right)
        }
    }

    func searchPreorder(_ node: Node?) {
        guard let node = node else { return }
        preorder.append(node.key)
        searchPreorder(node.left)
        searchPreorder(node.right)
    }

    func searchPostorder(_ node: Node?) {
        guard let node = node else { return }
        searchPostorder(node.left)
        searchPostorder(node.right)
        postorder.append(node.key)
    }

    let nodes = nodeinfo.enumerated().map{($0.0+1,$0.1[0],$0.1[1])}
    let sortedNode = nodes.sorted { $0.2 != $1.2 ? $0.2 > $1.2 : $0.1 < $1.1 }
    sortedNode.forEach { binaryTree($0.0, $0.1, &node) }

    searchPreorder(node)
    searchPostorder(node)

    return [preorder, postorder]
}
