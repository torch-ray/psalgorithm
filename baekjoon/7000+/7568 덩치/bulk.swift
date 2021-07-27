let n = Int(readLine()!)!
var a:[[Int]] = []
for _ in 0..<n {
    a.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}

for i in 0..<n {
    var cnt = 0
    for j in 0..<n {
        if a[i][0] < a[j][0] && a[i][1] < a[j][1] {
            cnt += 1
        }
    }
    print(cnt+1, terminator: " ")
}
