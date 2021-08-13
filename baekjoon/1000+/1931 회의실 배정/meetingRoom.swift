var m: [[Int]] = []
for _ in 0..<Int(readLine()!)! {
    m.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}
var s: Int? = nil, res = 0
m.sort{$0[1] != $1[1] ? $0[1]<$1[1]:$0[0]<$1[0]}
for time in m {
    guard let start = s else {
        s = time[1]
        res+=1
        continue
    }
    
    if start <= time[0] {
        s = time[1]
        res+=1
    }
}
print(res)
