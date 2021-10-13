struct Queue<T> {
    var arr:[T] = []
    let sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return arr.isEmpty
    }
    
    var count: Int {
        return arr.count
    }
    
    func peek() -> T? {
        return arr.first
    }
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        return (2*index) + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        return (2*index) + 2
    }
    
    func parentIndex(ofChildAt index: Int) -> Int {
        return (index-2)/2
    }
    
    mutating func pop() -> T? {
        guard !isEmpty else {
            return nil
        }
        
        arr.swapAt(0, count-1)
        defer {
            shiftDown(from: 0)
        }
        return arr.removeLast()
    }
    
    mutating func shiftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent
            
            if left < count && sort(arr[left], arr[candidate]) {
                candidate = left
            }
            
            if right < count && sort(arr[right], arr[candidate]) {
                candidate = right
            }
            
            if candidate == parent {
                return
            }
            
            arr.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    mutating func push(_ n: T) {
        arr.append(n)
    }
    
    mutating func shiftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while child > 0 && sort(arr[child], arr[parent]) {
            arr.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
}

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = input[0], V = input[1]
let S = Int(readLine()!)!
var graph = [[(Int, Int)]](repeating: [], count: N+1)

for _ in 0..<V {
    let info = readLine()!.split{$0==" "}.map{Int(String($0))!}
    graph[info[0]].append((info[1], info[2]))
}

let INF = Int.max
var res = [Int](repeating: INF, count: N+1)
res[S] = 0

var queue = Queue<(Int, Int)>(sort: { $0.1 < $1.1 })
queue.push((S, 0))

while !queue.isEmpty {
    let now = queue.pop()!
    
    
    let node = now.0, dist = now.1
    
    if res[node] < dist {
        continue
    }
    
    for nxt in graph[node] {
        let newCost = dist + nxt.1
        if res[nxt.0] > newCost {
            res[nxt.0] = newCost
            queue.push((nxt.0, newCost))
        }
    }
}
for idx in 1...N {
    print(res[idx] == INF ? "INF":res[idx])
}
