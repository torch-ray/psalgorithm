let n = readLine()!.split{$0==" "}.map{Int(String($0))!}
print(n[1]>=n[2] ? -1:n[0]/(n[2]-n[1])+1)

