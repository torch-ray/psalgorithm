let n = Int(readLine()!)!
var a = readLine()!.split{$0==" "}.map{Int(String($0))!}
for i in 1..<n {
    if a[i] < a[i-1]+a[i] {
        a[i] += a[i-1]
    }
}
print(a.max()!)
