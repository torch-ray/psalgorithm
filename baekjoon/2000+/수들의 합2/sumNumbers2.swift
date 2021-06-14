let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let arr = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var (s, e) = (0, 0)
var cnt = 0

while s<=e, e<n {
    let tmp = arr[s...e].reduce(0, +)
    if tmp == m {
        cnt+=1
        e+=1
    } else if s == e{
        e+=1
    } else if tmp < m{
        e+=1
    } else if tmp > m  {
        s+=1
    }
}
print(cnt)
