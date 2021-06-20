import Foundation
let input = readLine()!.split{$0==" "}.map{Int($0)!}
let (m, n) = (input[0], input[1])
var a = [[Int]]()
for _ in 0..<n{ a.append(readLine()!.split{$0==" "}.map{Int($0)!}) }
let (dx, dy) = ([-1, 1, 0, 0], [0, 0, -1, 1])
var queue = [(Int, Int)]()
var cnt = 0
var res = 0

for i in 0..<n {
    for j in 0..<m {
        if a[i][j] == 1 {queue.append((i, j))}
        else if a[i][j] == 0 {cnt+=1}
    }
}
if cnt==0{
    print(0)
    exit(0)
}

var cursor = 0
while cursor < queue.count {
    let nQ = queue[cursor]
    let (x, y) = (nQ.0, nQ.1)
    cursor+=1
    
    for i in 0..<4 {
        let (nx, ny) = (x+dx[i], y+dy[i])
        if (0..<n).contains(nx) && (0..<m).contains(ny) && a[nx][ny] == 0{
            queue.append((nx, ny))
            a[nx][ny] = a[x][y] + 1
            cnt-=1
            if res<a[nx][ny] {res=a[nx][ny]}
            if cnt<=0 {break}
        }
    }
}
if cnt>0 {print(-1)}
else {print(res-1)}
