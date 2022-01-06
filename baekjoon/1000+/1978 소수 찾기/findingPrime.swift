func p(_ n:Int) -> Set<Int> {
    var p: Set<Int> = []
    for i in 1...n where n%i==0 { p.insert(i) }
    return p
}

let _ = readLine()
let n = readLine()!.split{$0==" "}.map{Int(String($0))!}
var res = 0
for i in n where i>1 {
    let a: Set<Int> = [1, i]
    if a == p(i) { res += 1}
}
print(res)
