let N = readLine()!.split{$0==" "}.map{Int(String($0))!}
var map: [[Int]] = []

for _ in 0..<N.first! {
    map.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}

var point:[(Int, Int)] = []
var virus:[(Int, Int)] = []

for x in 0..<N.first! {
    for y in 0..<N.last! {
        if map[x][y] == 0  {
            point.append((x, y))
        }
        
        if map[x][y] == 2 {
            virus.append((x, y))
        }
    }
}

func combination(_ arr:[(Int, Int)], _ n:Int) -> [[(Int, Int)]] {
    var res: [[(Int, Int)]] = []
    if n == 0 { return [[]] }

    for i in 0..<arr.count {
        let elem = arr[i]
        let tmp = arr[(i+1)...]
        for j in combination(Array(tmp), n-1) {
            res.append([elem]+j)
        }
    }
    return res
}

func searchMap(with points:[(Int, Int)]) -> Int {
    var newMap = map
    let dx = [1, -1, 0, 0], dy = [0, 0, 1, -1]
    for tuple in points {
        newMap[tuple.0][tuple.1] = 1
    }
    
    var cursor = 0, queue = virus, cnt = 0
    
    while cursor < queue.count {
        let (x, y) = queue[cursor]
        cursor+=1
        
        for i in 0..<4 {
            let nx = x+dx[i], ny = y+dy[i]
            if (0..<N.first!).contains(nx) && (0..<N.last!).contains(ny) && newMap[nx][ny] == 0 {
                newMap[nx][ny] = 2
                queue.append((nx, ny))
                cnt+=1
            }
        }
    }
    
    return point.count - cnt - 3
}

let list = combination(point, 3)
var maxCnt = 0
for points in list {
    maxCnt = max(maxCnt, searchMap(with: points))
}
print(maxCnt)
