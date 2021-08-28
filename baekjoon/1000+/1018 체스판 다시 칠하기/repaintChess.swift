let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NM.first!, M = NM.last!
var chess: [[String]] = [], res = 64

for _ in 0..<NM.first! {
    chess.append(readLine()!.map{String($0)})
}

for row in 0...(N-8) {
    for col in 0...(M-8) {
        var cnt = 0
        
        for i in row..<(row+8) {
            for j in col..<(col+8) where chess[i][j] != ((i+j)%2 == 0 ? "B":"W") {
                cnt+=1
            }
        }
        res = min(res, cnt, 64-cnt)
    }
}
print(res)
