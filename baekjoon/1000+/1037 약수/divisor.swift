let _ = readLine()!
let N = readLine()!.split{$0==" "}.map{Int(String($0))!}
print(N.min()!*N.max()!)
