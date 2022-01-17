var g:[Int:[Int]] = [:]
let n = readLine()!.split{$0==" "}.map{Int(String($0))!}

for _ in 0..<n[1] {
    let ab = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (a, b) = (ab[0], ab[1])
    if g[a] == nil { g[a]=[b] }
    else { g[a]!.append(b) }
    if g[b] == nil { g[b]=[a] }
    else { g[b]!.append(a) }
}

var dv:[Int] = [], r = ""

func dfs(_ node:Int) {
    guard !dv.contains(node) else { return }
    dv.append(node)
    r+="\(node) "
    if let arr = g[node] {
        for n in arr.sorted() {
            dfs(n)
        }
    }
}
dfs(n[2])
r+="\n"
var bv:[Int] = []
func bfs(_ node:Int) {
    var q = [node]
    
    var c = 0
    while c < q.count {
        let n = q[c]
        c+=1
        if !bv.contains(n) {
            bv.append(n)
            r+="\(n) "
        }
        if let arr = g[n]?.sorted() {
            for ch in arr where !bv.contains(ch) {
                q.append(ch)
            }
        }
    }
}
bfs(n[2])

print(r)

